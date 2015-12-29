#
# 'make depend' uses makedepend to automatically generate dependencies 
#               (dependencies are added to end of Makefile)
# 'make'        build executable file 'mycc'
# 'make clean'  removes all .o and executable files
#

#Fastflow and Boost paths
FF_ROOT		= ../../fastflow
BOOST_ROOT 	= ../../boost_1_60_0

#Xeon's user
USR = spm1428

#Accelerator
ACC = mic0

#Program arguments
ARGS =

#Test script file
TEST = test

#file to copy on $(ACC)
FILES = 

# compiler
CC = icpc -mmic

# compiler flag
CXX = $(CC) -std=c++11 -DNO_DEFAULT_MAPPING

# compile-time flags
CFLAGS =

# header files other than /usr/include
INCLUDES = -I$(FF_ROOT)  -I$(BOOST_ROOT)

# define any libraries to link into executable:
LIBS = -pthread

#optimization flags
OPTFLAGS = -O3 -finline-functions -DNDEBUG -g -O0

# define the C source files
SRCS = Main.cpp

# define the C object files 
OBJS = $(SRCS:.cpp=.o)

# define the executable file 
MAIN = mapreduce


.PHONY: all depend clean

all:    $(MAIN) copy execute
	@echo  Simple compiler named mycc has been compiled

$(MAIN): $(OBJS) 
	$(CXX) $(CFLAGS) $(INCLUDES) $(OPTFLAGS) -o $(MAIN) $(OBJS) $(LIBS)

copy:
	scp $(FILES) $(TEST) $(MAIN) $(USR)@$(ACC):~

execute:
	ssh $(USR)@$(ACC) ./$(MAIN) $(ARGS)

test:
	ssh $(USR)@$(ACC) ./$(TEST)

.cpp.o:
	$(CXX) $(CFLAGS) $(INCLUDES) $(OPTFLAGS) -g -c $<  -o $@

clean:
	$(RM) *.o *~ $(MAIN)

depend: $(SRCS)
	makedepend $(INCLUDES) $^

# DO NOT DELETE THIS LINE -- make depend needs it

Main.o: ../../fastflow/ff/pipeline.hpp ../../fastflow/ff/svector.hpp
Main.o: /usr/include/stdlib.h /usr/include/features.h
Main.o: /usr/include/stdc-predef.h /usr/include/alloca.h
Main.o: ../../fastflow/ff/fftree.hpp ../../fastflow/ff/node.hpp
Main.o: ../../fastflow/ff/platforms/platform.h
Main.o: ../../fastflow/ff/platforms/liblfds.h /usr/include/assert.h
Main.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
Main.o: /usr/include/wchar.h ../../fastflow/ff/cycle.h /usr/include/time.h
Main.o: /usr/include/xlocale.h ../../fastflow/ff/utils.hpp
Main.o: /usr/include/string.h ../../fastflow/ff/spin-lock.hpp
Main.o: ../../fastflow/ff/sysdep.h ../../fastflow/ff/config.hpp
Main.o: ../../fastflow/ff/buffer.hpp ../../fastflow/ff/ubuffer.hpp
Main.o: ../../fastflow/ff/dynqueue.hpp ../../fastflow/ff/mapper.hpp
Main.o: ../../fastflow/ff/mapping_utils.hpp /usr/include/errno.h
Main.o: ../../fastflow/ff/barrier.hpp ../../fastflow/ff/ocl/clEnvironment.hpp
Main.o: ../../fastflow/ff/farm.hpp ../../fastflow/ff/lb.hpp
Main.o: ../../fastflow/ff/gt.hpp ../../fastflow/ff/multinode.hpp
Main.o: ../../boost_1_60_0/boost/utility/string_ref.hpp
Main.o: ../../boost_1_60_0/boost/config.hpp
Main.o: ../../boost_1_60_0/boost/config/user.hpp
Main.o: ../../boost_1_60_0/boost/config/select_compiler_config.hpp
Main.o: ../../boost_1_60_0/boost/config/select_platform_config.hpp
Main.o: ../../boost_1_60_0/boost/config/platform/linux.hpp
Main.o: ../../boost_1_60_0/boost/config/posix_features.hpp
Main.o: /usr/include/unistd.h /usr/include/getopt.h
Main.o: ../../boost_1_60_0/boost/config/suffix.hpp /usr/include/limits.h
Main.o: ../../boost_1_60_0/boost/detail/workaround.hpp
Main.o: ../../boost_1_60_0/boost/config.hpp
Main.o: ../../boost_1_60_0/boost/utility/string_ref_fwd.hpp
Main.o: ../../boost_1_60_0/boost/throw_exception.hpp MapReduceJob.hpp
Main.o: TaskScheduler.hpp InterTask.hpp InterResult.hpp Result.hpp
Main.o: MapReduceWorker.hpp Task.hpp RecordReader.hpp LineRecordReader.hpp
Main.o: MapResult.hpp MapTask.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/posix_time.hpp
Main.o: ../../boost_1_60_0/boost/date_time/compiler_config.hpp
Main.o: ../../boost_1_60_0/boost/date_time/locale_config.hpp
Main.o: ../../boost_1_60_0/boost/cstdint.hpp /usr/include/stdint.h
Main.o: ../../boost_1_60_0/boost/config/auto_link.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/ptime.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/posix_time_system.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/posix_time_config.hpp
Main.o: ../../boost_1_60_0/boost/limits.hpp
Main.o: ../../boost_1_60_0/boost/config/no_tr1/cmath.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_duration.hpp
Main.o: ../../boost_1_60_0/boost/operators.hpp
Main.o: ../../boost_1_60_0/boost/static_assert.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_defs.hpp
Main.o: ../../boost_1_60_0/boost/date_time/special_defs.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_resolution_traits.hpp
Main.o: ../../boost_1_60_0/boost/date_time/int_adapter.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/gregorian_types.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date.hpp
Main.o: ../../boost_1_60_0/boost/date_time/year_month_day.hpp
Main.o: ../../boost_1_60_0/boost/date_time/period.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_calendar.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_weekday.hpp
Main.o: ../../boost_1_60_0/boost/date_time/constrained_value.hpp
Main.o: ../../boost_1_60_0/boost/mpl/if.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/value_wknd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/static_cast.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/workaround.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/integral.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/msvc.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/eti.hpp
Main.o: ../../boost_1_60_0/boost/mpl/int.hpp
Main.o: ../../boost_1_60_0/boost/mpl/int_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/adl_barrier.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/adl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/intel.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/gcc.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/nttp_decl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/nttp.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/cat.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/config/config.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/integral_wrapper.hpp
Main.o: ../../boost_1_60_0/boost/mpl/integral_c_tag.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/static_constant.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/na_spec.hpp
Main.o: ../../boost_1_60_0/boost/mpl/lambda_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/void_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/na.hpp
Main.o: ../../boost_1_60_0/boost/mpl/bool.hpp
Main.o: ../../boost_1_60_0/boost/mpl/bool_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/na_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/ctps.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/lambda.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/ttp.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/lambda_arity_param.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/template_arity_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/arity.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/dtp.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/preprocessor/params.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/preprocessor.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/preprocessor/enum.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/preprocessor/def_params_tail.hpp
Main.o: ../../boost_1_60_0/boost/mpl/limits/arity.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/comma_if.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/punctuation/comma_if.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/control/if.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/control/iif.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/logical/bool.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/facilities/empty.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/punctuation/comma.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/logical/and.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/logical/bitand.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/identity.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/facilities/identity.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/tuple/eat.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/empty.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/preprocessor/filter_params.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/preprocessor/sub.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/preprocessor/tuple.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/overload_resolution.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/lambda_support.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_base_of.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_base_and_derived.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/intrinsics.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/detail/config.hpp
Main.o: ../../boost_1_60_0/boost/version.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/integral_constant.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_class.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_union.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/detail/yes_no_type.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_same.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_convertible.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_array.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_arithmetic.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_integral.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_floating_point.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_void.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_abstract.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/add_lvalue_reference.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/add_reference.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/add_rvalue_reference.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_reference.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_lvalue_reference.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_rvalue_reference.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_function.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/detail/is_function_ptr_helper.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/declval.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/remove_cv.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_defs.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_day_of_year.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian_calendar.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian_calendar.ipp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_ymd.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_day.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_year.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_month.hpp
Main.o: ../../boost_1_60_0/boost/shared_ptr.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/shared_ptr.hpp
Main.o: ../../boost_1_60_0/boost/config/no_tr1/memory.hpp
Main.o: ../../boost_1_60_0/boost/assert.hpp
Main.o: ../../boost_1_60_0/boost/checked_delete.hpp
Main.o: ../../boost_1_60_0/boost/core/checked_delete.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/shared_count.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/bad_weak_ptr.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/sp_counted_base.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/sp_has_sync.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/sp_counted_base_gcc_x86.hpp
Main.o: ../../boost_1_60_0/boost/detail/sp_typeinfo.hpp
Main.o: ../../boost_1_60_0/boost/core/typeinfo.hpp
Main.o: ../../boost_1_60_0/boost/core/demangle.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/sp_counted_impl.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/sp_disable_deprecated.hpp
Main.o: ../../boost_1_60_0/boost/core/addressof.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/sp_convertible.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/sp_nullptr_t.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/spinlock_pool.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/spinlock.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/spinlock_nt.hpp
Main.o: ../../boost_1_60_0/boost/smart_ptr/detail/operator_bool.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_duration.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_duration.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/greg_date.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_generators.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_clock_device.hpp
Main.o: ../../boost_1_60_0/boost/date_time/c_time.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_iterator.hpp
Main.o: ../../boost_1_60_0/boost/date_time/adjust_functors.hpp
Main.o: ../../boost_1_60_0/boost/date_time/wrapping_int.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_system_split.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_system_counted.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/time_formatters_limited.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/gregorian.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/conversion.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/formatters_limited.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_formatting_limited.hpp
Main.o: ../../boost_1_60_0/boost/date_time/iso_format.hpp
Main.o: ../../boost_1_60_0/boost/date_time/parse_format_base.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_format_simple.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/gregorian_io.hpp
Main.o: ../../boost_1_60_0/boost/io/ios_state.hpp
Main.o: ../../boost_1_60_0/boost/io_fwd.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_facet.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/replace.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/config.hpp
Main.o: ../../boost_1_60_0/boost/range/iterator_range_core.hpp
Main.o: ../../boost_1_60_0/boost/iterator/iterator_traits.hpp
Main.o: ../../boost_1_60_0/boost/detail/iterator.hpp
Main.o: ../../boost_1_60_0/boost/iterator/iterator_facade.hpp
Main.o: ../../boost_1_60_0/boost/iterator.hpp
Main.o: ../../boost_1_60_0/boost/iterator/interoperable.hpp
Main.o: ../../boost_1_60_0/boost/mpl/or.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/use_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/nested_type_wknd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/compiler.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/stringize.hpp
Main.o: ../../boost_1_60_0/boost/iterator/detail/config_def.hpp
Main.o: ../../boost_1_60_0/boost/iterator/detail/config_undef.hpp
Main.o: ../../boost_1_60_0/boost/iterator/iterator_categories.hpp
Main.o: ../../boost_1_60_0/boost/mpl/eval_if.hpp
Main.o: ../../boost_1_60_0/boost/mpl/identity.hpp
Main.o: ../../boost_1_60_0/boost/mpl/placeholders.hpp
Main.o: ../../boost_1_60_0/boost/mpl/arg.hpp
Main.o: ../../boost_1_60_0/boost/mpl/arg_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/na_assert.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/arity_spec.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/arg_typedef.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/iterator/detail/facade_iterator_category.hpp
Main.o: ../../boost_1_60_0/boost/mpl/and.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/assert.hpp
Main.o: ../../boost_1_60_0/boost/mpl/not.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/yes_no.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/arrays.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/gpu.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/pp_counter.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_const.hpp
Main.o: ../../boost_1_60_0/boost/iterator/detail/enable_if.hpp
Main.o: ../../boost_1_60_0/boost/utility/addressof.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/add_const.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/add_pointer.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/remove_reference.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/remove_const.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_pod.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_scalar.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_enum.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_pointer.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_member_pointer.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_member_function_pointer.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/detail/is_mem_fun_pointer_tester.hpp
Main.o: ../../boost_1_60_0/boost/mpl/always.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/preprocessor/default_params.hpp
Main.o: ../../boost_1_60_0/boost/mpl/apply.hpp
Main.o: ../../boost_1_60_0/boost/mpl/apply_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/apply_wrap.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/has_apply.hpp
Main.o: ../../boost_1_60_0/boost/mpl/has_xxx.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/type_wrapper.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/has_xxx.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/msvc_typename.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/array/elem.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/array/data.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/tuple/elem.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/facilities/expand.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/facilities/overload.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/variadic/size.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/tuple/rem.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/tuple/detail/is_single_return.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/variadic/elem.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/array/size.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/enum_params.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/repeat.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/debug/error.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/detail/auto_rec.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/enum_trailing_params.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/has_apply.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/msvc_never_true.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/lambda.hpp
Main.o: ../../boost_1_60_0/boost/mpl/bind.hpp
Main.o: ../../boost_1_60_0/boost/mpl/bind_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/bind.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/next.hpp
Main.o: ../../boost_1_60_0/boost/mpl/next_prior.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/common_name_wknd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/protect.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/full_lambda.hpp
Main.o: ../../boost_1_60_0/boost/mpl/quote.hpp
Main.o: ../../boost_1_60_0/boost/mpl/void.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/has_type.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/bcc.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/template_arity.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/range/functions.hpp
Main.o: ../../boost_1_60_0/boost/range/begin.hpp
Main.o: ../../boost_1_60_0/boost/range/config.hpp
Main.o: ../../boost_1_60_0/boost/range/iterator.hpp
Main.o: ../../boost_1_60_0/boost/range/range_fwd.hpp
Main.o: ../../boost_1_60_0/boost/range/mutable_iterator.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/extract_optional_type.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/msvc_has_iterator_workaround.hpp
Main.o: ../../boost_1_60_0/boost/range/const_iterator.hpp
Main.o: ../../boost_1_60_0/boost/range/end.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/implementation_help.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/common.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/sfinae.hpp
Main.o: ../../boost_1_60_0/boost/range/size.hpp
Main.o: ../../boost_1_60_0/boost/range/size_type.hpp
Main.o: ../../boost_1_60_0/boost/range/difference_type.hpp
Main.o: ../../boost_1_60_0/boost/range/has_range_iterator.hpp
Main.o: ../../boost_1_60_0/boost/utility/enable_if.hpp
Main.o: ../../boost_1_60_0/boost/core/enable_if.hpp
Main.o: ../../boost_1_60_0/boost/range/concepts.hpp
Main.o: ../../boost_1_60_0/boost/concept_check.hpp
Main.o: ../../boost_1_60_0/boost/concept/assert.hpp
Main.o: ../../boost_1_60_0/boost/concept/detail/borland.hpp
Main.o: ../../boost_1_60_0/boost/concept/detail/backward_compatibility.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/conversion_traits.hpp
Main.o: ../../boost_1_60_0/boost/concept/usage.hpp
Main.o: ../../boost_1_60_0/boost/concept/detail/concept_def.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/for_each_i.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/arithmetic/dec.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/arithmetic/inc.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/for.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/detail/for.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/control/expr_iif.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/seq.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/elem.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/size.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/detail/is_empty.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/logical/compl.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/enum.hpp
Main.o: ../../boost_1_60_0/boost/concept/detail/concept_undef.hpp
Main.o: ../../boost_1_60_0/boost/iterator/iterator_concepts.hpp
Main.o: ../../boost_1_60_0/boost/range/value_type.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/misc_concept.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/make_unsigned.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/conditional.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_signed.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_unsigned.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_volatile.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/add_volatile.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/has_member_size.hpp
Main.o: ../../boost_1_60_0/boost/utility.hpp
Main.o: ../../boost_1_60_0/boost/utility/base_from_member.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/enum_binary_params.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/repeat_from_to.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/arithmetic/add.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/control/while.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/list/fold_left.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/list/detail/fold_left.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/list/adt.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/detail/is_binary.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/detail/check.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/list/fold_right.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/list/detail/fold_right.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/list/reverse.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/control/detail/while.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/arithmetic/sub.hpp
Main.o: ../../boost_1_60_0/boost/utility/binary.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/control/deduce_d.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/cat.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/fold_left.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/seq/transform.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/arithmetic/mod.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/arithmetic/detail/div_base.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/comparison/less_equal.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/logical/not.hpp
Main.o: ../../boost_1_60_0/boost/utility/identity_type.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/function_traits.hpp
Main.o: ../../boost_1_60_0/boost/next_prior.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/integral_promotion.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/make_signed.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/has_plus.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/detail/has_binary_operator.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_fundamental.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/remove_pointer.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/has_plus_assign.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/has_minus.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/has_minus_assign.hpp
Main.o: ../../boost_1_60_0/boost/noncopyable.hpp
Main.o: ../../boost_1_60_0/boost/core/noncopyable.hpp
Main.o: ../../boost_1_60_0/boost/range/distance.hpp
Main.o: ../../boost_1_60_0/boost/range/empty.hpp
Main.o: ../../boost_1_60_0/boost/range/rbegin.hpp
Main.o: ../../boost_1_60_0/boost/range/reverse_iterator.hpp
Main.o: ../../boost_1_60_0/boost/iterator/reverse_iterator.hpp
Main.o: ../../boost_1_60_0/boost/iterator/iterator_adaptor.hpp
Main.o: ../../boost_1_60_0/boost/range/rend.hpp
Main.o: ../../boost_1_60_0/boost/range/algorithm/equal.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/safe_bool.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/find_format.hpp
Main.o: ../../boost_1_60_0/boost/range/as_literal.hpp
Main.o: ../../boost_1_60_0/boost/range/iterator_range.hpp
Main.o: ../../boost_1_60_0/boost/range/iterator_range_io.hpp
Main.o: ../../boost_1_60_0/boost/range/detail/str_types.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/concept.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/find_format.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/find_format_store.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/replace_storage.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/sequence_traits.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/yes_no_type.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/sequence.hpp
Main.o: ../../boost_1_60_0/boost/mpl/logical.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/find_format_all.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/finder.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/constants.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/finder.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/compare.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/formatter.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/formatter.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/util.hpp
Main.o: ../../boost_1_60_0/boost/date_time/special_values_formatter.hpp
Main.o: ../../boost_1_60_0/boost/date_time/period_formatter.hpp
Main.o: ../../boost_1_60_0/boost/date_time/period_parser.hpp
Main.o: ../../boost_1_60_0/boost/date_time/string_parse_tree.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/bad_lexical_cast.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/try_lexical_convert.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/is_character.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/converter_numeric.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/is_float.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/cast.hpp
Main.o: ../../boost_1_60_0/boost/type.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/converter.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/conversion_traits.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/conversion_traits.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/meta.hpp
Main.o: ../../boost_1_60_0/boost/mpl/equal_to.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/comparison_op.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/numeric_op.hpp
Main.o: ../../boost_1_60_0/boost/mpl/numeric_cast.hpp
Main.o: ../../boost_1_60_0/boost/mpl/tag.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/has_tag.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/numeric_cast_utils.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/config/forwarding.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/msvc_eti_base.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/is_msvc_eti_arg.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/int_float_mixture.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/int_float_mixture_enum.hpp
Main.o: ../../boost_1_60_0/boost/mpl/integral_c.hpp
Main.o: ../../boost_1_60_0/boost/mpl/integral_c_fwd.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/sign_mixture.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/sign_mixture_enum.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/udt_builtin_mixture.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/udt_builtin_mixture_enum.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/is_subranged.hpp
Main.o: ../../boost_1_60_0/boost/mpl/multiplies.hpp
Main.o: ../../boost_1_60_0/boost/mpl/times.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/arithmetic_op.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/largest_int.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/less.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/converter_policies.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/converter.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/bounds.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/bounds.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/numeric_cast_traits.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/numeric_cast_traits.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/preprocessed/numeric_cast_traits_common.hpp
Main.o: ../../boost_1_60_0/boost/numeric/conversion/detail/preprocessed/numeric_cast_traits_long_long.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/converter_lexical.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/has_left_shift.hpp
Main.o: ../../boost_1_60_0/boost/type_traits/has_right_shift.hpp
Main.o: ../../boost_1_60_0/boost/detail/lcast_precision.hpp
Main.o: ../../boost_1_60_0/boost/integer_traits.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/widest_char.hpp
Main.o: ../../boost_1_60_0/boost/array.hpp ../../boost_1_60_0/boost/swap.hpp
Main.o: ../../boost_1_60_0/boost/core/swap.hpp
Main.o: ../../boost_1_60_0/boost/functional/hash_fwd.hpp
Main.o: ../../boost_1_60_0/boost/functional/hash/hash_fwd.hpp
Main.o: ../../boost_1_60_0/boost/container/container_fwd.hpp
Main.o: ../../boost_1_60_0/boost/container/detail/std_fwd.hpp
Main.o: ../../boost_1_60_0/boost/move/detail/std_ns_begin.hpp
Main.o: ../../boost_1_60_0/boost/move/detail/std_ns_end.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/converter_lexical_streams.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/lcast_char_constants.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/lcast_unsigned_converters.hpp
Main.o: ../../boost_1_60_0/boost/lexical_cast/detail/inf_nan.hpp
Main.o: ../../boost_1_60_0/boost/math/special_functions/sign.hpp
Main.o: ../../boost_1_60_0/boost/math/tools/config.hpp
Main.o: ../../boost_1_60_0/boost/predef.h
Main.o: ../../boost_1_60_0/boost/predef/language.h
Main.o: ../../boost_1_60_0/boost/predef/language/stdc.h
Main.o: ../../boost_1_60_0/boost/predef/version_number.h
Main.o: ../../boost_1_60_0/boost/predef/make.h
Main.o: ../../boost_1_60_0/boost/predef/detail/test.h
Main.o: ../../boost_1_60_0/boost/predef/language/stdcpp.h
Main.o: ../../boost_1_60_0/boost/predef/language/objc.h
Main.o: ../../boost_1_60_0/boost/predef/architecture.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/alpha.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/arm.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/blackfin.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/convex.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/ia64.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/m68k.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/mips.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/parisc.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/ppc.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/pyramid.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/rs6k.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/sparc.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/superh.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/sys370.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/sys390.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/x86.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/x86/32.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/x86/64.h
Main.o: ../../boost_1_60_0/boost/predef/architecture/z.h
Main.o: ../../boost_1_60_0/boost/predef/compiler.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/borland.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/clang.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/comeau.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/compaq.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/diab.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/digitalmars.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/dignus.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/edg.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/ekopath.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/gcc_xml.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/gcc.h
Main.o: ../../boost_1_60_0/boost/predef/detail/comp_detected.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/greenhills.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/hp_acc.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/iar.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/ibm.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/intel.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/kai.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/llvm.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/metaware.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/metrowerks.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/microtec.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/mpw.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/palm.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/pgi.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/sgi_mipspro.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/sunpro.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/tendra.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/visualc.h
Main.o: ../../boost_1_60_0/boost/predef/compiler/watcom.h
Main.o: ../../boost_1_60_0/boost/predef/library.h
Main.o: ../../boost_1_60_0/boost/predef/library/c.h
Main.o: ../../boost_1_60_0/boost/predef/library/c/_prefix.h
Main.o: ../../boost_1_60_0/boost/predef/detail/_cassert.h
Main.o: ../../boost_1_60_0/boost/predef/library/c/gnu.h
Main.o: ../../boost_1_60_0/boost/predef/library/c/uc.h
Main.o: ../../boost_1_60_0/boost/predef/library/c/vms.h
Main.o: ../../boost_1_60_0/boost/predef/library/c/zos.h
Main.o: ../../boost_1_60_0/boost/predef/library/std.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/_prefix.h
Main.o: ../../boost_1_60_0/boost/predef/detail/_exception.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/cxx.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/dinkumware.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/libcomo.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/modena.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/msl.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/roguewave.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/sgi.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/stdcpp3.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/stlport.h
Main.o: ../../boost_1_60_0/boost/predef/library/std/vacpp.h
Main.o: ../../boost_1_60_0/boost/predef/os.h
Main.o: ../../boost_1_60_0/boost/predef/os/aix.h
Main.o: ../../boost_1_60_0/boost/predef/detail/os_detected.h
Main.o: ../../boost_1_60_0/boost/predef/os/amigaos.h
Main.o: ../../boost_1_60_0/boost/predef/os/android.h
Main.o: ../../boost_1_60_0/boost/predef/os/beos.h
Main.o: ../../boost_1_60_0/boost/predef/os/bsd.h
Main.o: ../../boost_1_60_0/boost/predef/os/macos.h
Main.o: ../../boost_1_60_0/boost/predef/os/ios.h
Main.o: ../../boost_1_60_0/boost/predef/os/bsd/bsdi.h
Main.o: ../../boost_1_60_0/boost/predef/os/bsd/dragonfly.h
Main.o: ../../boost_1_60_0/boost/predef/os/bsd/free.h
Main.o: ../../boost_1_60_0/boost/predef/os/bsd/open.h
Main.o: ../../boost_1_60_0/boost/predef/os/bsd/net.h
Main.o: ../../boost_1_60_0/boost/predef/os/cygwin.h
Main.o: ../../boost_1_60_0/boost/predef/os/haiku.h
Main.o: ../../boost_1_60_0/boost/predef/os/hpux.h
Main.o: ../../boost_1_60_0/boost/predef/os/irix.h
Main.o: ../../boost_1_60_0/boost/predef/os/linux.h
Main.o: ../../boost_1_60_0/boost/predef/os/os400.h
Main.o: ../../boost_1_60_0/boost/predef/os/qnxnto.h
Main.o: ../../boost_1_60_0/boost/predef/os/solaris.h
Main.o: ../../boost_1_60_0/boost/predef/os/unix.h
Main.o: ../../boost_1_60_0/boost/predef/os/vms.h
Main.o: ../../boost_1_60_0/boost/predef/os/windows.h
Main.o: ../../boost_1_60_0/boost/predef/other.h
Main.o: ../../boost_1_60_0/boost/predef/other/endian.h
Main.o: ../../boost_1_60_0/boost/predef/platform.h
Main.o: ../../boost_1_60_0/boost/predef/platform/mingw.h
Main.o: ../../boost_1_60_0/boost/predef/platform/windows_desktop.h
Main.o: ../../boost_1_60_0/boost/predef/platform/windows_store.h
Main.o: ../../boost_1_60_0/boost/predef/platform/windows_phone.h
Main.o: ../../boost_1_60_0/boost/predef/platform/windows_runtime.h
Main.o: ../../boost_1_60_0/boost/predef/hardware.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/x86.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/x86/versions.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/x86_amd.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/x86_amd/versions.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/arm.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/arm/versions.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/ppc.h
Main.o: ../../boost_1_60_0/boost/predef/hardware/simd/ppc/versions.h
Main.o: ../../boost_1_60_0/boost/predef/version.h
Main.o: ../../boost_1_60_0/boost/math/tools/user.hpp
Main.o: ../../boost_1_60_0/boost/math/special_functions/math_fwd.hpp
Main.o: ../../boost_1_60_0/boost/math/special_functions/detail/round_fwd.hpp
Main.o: ../../boost_1_60_0/boost/math/tools/promotion.hpp
Main.o: ../../boost_1_60_0/boost/math/policies/policy.hpp
Main.o: ../../boost_1_60_0/boost/mpl/list.hpp
Main.o: ../../boost_1_60_0/boost/mpl/limits/list.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/inc.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/contains.hpp
Main.o: ../../boost_1_60_0/boost/mpl/contains_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/sequence_tag.hpp
Main.o: ../../boost_1_60_0/boost/mpl/sequence_tag_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/has_begin.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/contains_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/begin_end.hpp
Main.o: ../../boost_1_60_0/boost/mpl/begin_end_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/begin_end_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/traits_lambda_spec.hpp
Main.o: ../../boost_1_60_0/boost/mpl/find.hpp
Main.o: ../../boost_1_60_0/boost/mpl/find_if.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/find_if_pred.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/iter_apply.hpp
Main.o: ../../boost_1_60_0/boost/mpl/deref.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/msvc_type.hpp
Main.o: ../../boost_1_60_0/boost/mpl/iter_fold_if.hpp
Main.o: ../../boost_1_60_0/boost/mpl/pair.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/iter_fold_if_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/same_as.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/lambda_spec.hpp
Main.o: ../../boost_1_60_0/boost/mpl/remove_if.hpp
Main.o: ../../boost_1_60_0/boost/mpl/fold.hpp
Main.o: ../../boost_1_60_0/boost/mpl/O1_size.hpp
Main.o: ../../boost_1_60_0/boost/mpl/O1_size_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/O1_size_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/long.hpp
Main.o: ../../boost_1_60_0/boost/mpl/long_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/has_size.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/fold_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/reverse_fold.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/reverse_fold_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/inserter_algorithm.hpp
Main.o: ../../boost_1_60_0/boost/mpl/back_inserter.hpp
Main.o: ../../boost_1_60_0/boost/mpl/push_back.hpp
Main.o: ../../boost_1_60_0/boost/mpl/push_back_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/push_back_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/inserter.hpp
Main.o: ../../boost_1_60_0/boost/mpl/front_inserter.hpp
Main.o: ../../boost_1_60_0/boost/mpl/push_front.hpp
Main.o: ../../boost_1_60_0/boost/mpl/push_front_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/push_front_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/clear.hpp
Main.o: ../../boost_1_60_0/boost/mpl/clear_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/clear_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/vector.hpp
Main.o: ../../boost_1_60_0/boost/mpl/limits/vector.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/at.hpp
Main.o: ../../boost_1_60_0/boost/mpl/at_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/at_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/advance.hpp
Main.o: ../../boost_1_60_0/boost/mpl/advance_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/negate.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/advance_forward.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/advance_backward.hpp
Main.o: ../../boost_1_60_0/boost/mpl/prior.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/size.hpp
Main.o: ../../boost_1_60_0/boost/mpl/size_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/size_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/distance.hpp
Main.o: ../../boost_1_60_0/boost/mpl/distance_fwd.hpp
Main.o: ../../boost_1_60_0/boost/mpl/iter_fold.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/iter_fold_impl.hpp
Main.o: ../../boost_1_60_0/boost/mpl/aux_/include_preprocessed.hpp
Main.o: ../../boost_1_60_0/boost/mpl/iterator_range.hpp
Main.o: ../../boost_1_60_0/boost/mpl/comparison.hpp
Main.o: ../../boost_1_60_0/boost/mpl/not_equal_to.hpp
Main.o: ../../boost_1_60_0/boost/mpl/greater.hpp
Main.o: ../../boost_1_60_0/boost/mpl/less_equal.hpp
Main.o: ../../boost_1_60_0/boost/mpl/greater_equal.hpp /usr/include/math.h
Main.o: ../../boost_1_60_0/boost/config/no_tr1/complex.hpp
Main.o: ../../boost_1_60_0/boost/math/special_functions/detail/fp_traits.hpp
Main.o: ../../boost_1_60_0/boost/detail/endian.hpp
Main.o: ../../boost_1_60_0/boost/predef/detail/endian_compat.h
Main.o: ../../boost_1_60_0/boost/math/special_functions/fpclassify.hpp
Main.o: ../../boost_1_60_0/boost/math/tools/real_cast.hpp
Main.o: ../../boost_1_60_0/boost/integer.hpp
Main.o: ../../boost_1_60_0/boost/integer_fwd.hpp
Main.o: ../../boost_1_60_0/boost/detail/basic_pointerbuf.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/case_conv.hpp
Main.o: ../../boost_1_60_0/boost/iterator/transform_iterator.hpp
Main.o: ../../boost_1_60_0/boost/utility/result_of.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/iteration/iterate.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/slot/slot.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/slot/detail/def.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/repetition/enum_shifted_params.hpp
Main.o: ../../boost_1_60_0/boost/preprocessor/facilities/intercept.hpp
Main.o: ../../boost_1_60_0/boost/utility/declval.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/detail/case_conv.hpp
Main.o: ../../boost_1_60_0/boost/date_time/string_convert.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_generator_formatter.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_generator_parser.hpp
Main.o: ../../boost_1_60_0/boost/date_time/format_date_parser.hpp
Main.o: ../../boost_1_60_0/boost/date_time/strings_from_facet.hpp
Main.o: ../../boost_1_60_0/boost/date_time/special_values_parser.hpp
Main.o: ../../boost_1_60_0/boost/date_time/gregorian/parsers.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_parsing.hpp
Main.o: ../../boost_1_60_0/boost/tokenizer.hpp
Main.o: ../../boost_1_60_0/boost/token_iterator.hpp
Main.o: ../../boost_1_60_0/boost/iterator/minimum_category.hpp
Main.o: ../../boost_1_60_0/boost/token_functions.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/posix_time_types.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_clock.hpp
Main.o: ../../boost_1_60_0/boost/date_time/microsec_time_clock.hpp
Main.o: ../../boost_1_60_0/boost/date_time/filetime_functions.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/posix_time_duration.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/time_period.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_iterator.hpp
Main.o: ../../boost_1_60_0/boost/date_time/dst_rules.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_formatting_streams.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_formatting_locales.hpp
Main.o: ../../boost_1_60_0/boost/date_time/date_names_put.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/posix_time_io.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_facet.hpp
Main.o: ../../boost_1_60_0/boost/algorithm/string/erase.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/conversion.hpp
Main.o: ../../boost_1_60_0/boost/date_time/posix_time/time_parsers.hpp
Main.o: ../../boost_1_60_0/boost/date_time/time_parsing.hpp
Main.o: TextInputFormat.hpp ../../fastflow/ff/parallel_for.hpp
Main.o: ../../fastflow/ff/parallel_for_internals.hpp InputFormat.hpp
Main.o: TextSplitRecordReader.hpp /usr/include/fcntl.h
