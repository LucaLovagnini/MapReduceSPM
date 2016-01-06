/*
 * MapReduceHash.hpp
 *
 *  Created on: Jan 4, 2016
 *      Author: luca
 */

#ifndef MAPREDUCEHASH_HPP_
#define MAPREDUCEHASH_HPP_

#include <stdlib.h>

using namespace std;

template <typename ResultT, ResultT OffsetBasis, ResultT Prime>
class basic_fnv1a final
{

  static_assert(std::is_unsigned<ResultT>::value, "need unsigned integer");

public:

  using result_type = ResultT;

private:

  result_type state_ {};

public:


  basic_fnv1a() noexcept : state_ {OffsetBasis}
  {
  }

   void
  update(const void *const data, const std::size_t size) noexcept
  {
    const auto cdata = static_cast<const unsigned char *>(data);
    auto acc = this->state_;
    for (auto i = std::size_t {}; i < size; ++i)
      {
        const auto next = std::size_t {cdata[i]};
        acc = (acc ^ next) * Prime;
      }
    this->state_ = acc;
  }

   result_type
  digest() const noexcept
  {
    return this->state_;
  }

};

//Following paramaters taken from http://www.isthe.com/chongo/tech/comp/fnv/index.html

using fnv1a_32 = basic_fnv1a<std::uint32_t,
                             UINT32_C(2166136261),
                             UINT32_C(16777619)>;

using fnv1a_64 = basic_fnv1a<std::uint64_t,
                             UINT64_C(14695981039346656037),
                             UINT64_C(1099511628211)>;

template <std::size_t Bits>
struct fnv1a;

template <>
struct fnv1a<32>
{
  using type = fnv1a_32;
};

template <>
struct fnv1a<64>
{
  using type = fnv1a_64;
};

template <std::size_t Bits>
using fnv1a_t = typename fnv1a<Bits>::type;

std::size_t
hash_bytes(const void *const data, const std::size_t size) noexcept
{
  auto hashfn = fnv1a_t<CHAR_BIT * sizeof(std::size_t)> {};
  hashfn.update(data, size);
  return hashfn.digest();
}


template <typename T>
struct MapReduceHash
{
  std::size_t
  operator()(const T& obj) const noexcept
  {
	  cout<<"MapReduceHash!"<<endl;
    // Fallback implementation.
    auto hashfn = std::hash<T> {};
    return hashfn(obj);
  }
};

#endif /* MAPREDUCEHASH_HPP_ */
