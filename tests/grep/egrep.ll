; ModuleID = 'egrep.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.matcher = type { i8*, void (i8*, i64)*, i64 (i8*, i64, i64*, i8*)* }

@.str = private unnamed_addr constant [6 x i8] c"egrep\00", align 1
@matchers = constant [2 x %struct.matcher] [%struct.matcher { i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), void (i8*, i64)* @Ecompile, i64 (i8*, i64, i64*, i8*)* @EGexecute }, %struct.matcher zeroinitializer], align 16
@before_options = constant [50 x i8] c"PATTERN is an extended regular expression (ERE).\0A\00", align 16
@after_options = constant [61 x i8] c"Invocation as `egrep' is deprecated; use `grep -E' instead.\0A\00", align 16

; Function Attrs: nounwind uwtable
define internal void @Ecompile(i8* %pattern, i64 %size) #0 {
  tail call void @llvm.dbg.value(metadata !{i8* %pattern}, i64 0, metadata !15), !dbg !47
  tail call void @llvm.dbg.value(metadata !{i64 %size}, i64 0, metadata !16), !dbg !47
  tail call void @GEAcompile(i8* %pattern, i64 %size, i64 2210588) #3, !dbg !48
  ret void, !dbg !49
}

declare i64 @EGexecute(i8*, i64, i64*, i8*) #1

declare void @GEAcompile(i8*, i64, i64) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!44, !45}
!llvm.ident = !{!46}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.5 (http://llvm.org/git/clang.git 9ac60551645be7a3c5f9b702159052f2f1a5b26a) (http://llvm.org/git/llvm.git 5e7eecd8509707a77a6b84c7879b947e14698ef0)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !17, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/kostas/workspace/test/grep-2.7/src/egrep.c] [DW_LANG_C99]
!1 = metadata !{metadata !"egrep.c", metadata !"/home/kostas/workspace/test/grep-2.7/src"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"Ecompile", metadata !"Ecompile", metadata !"", i32 5, metadata !6, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*, i64)* @Ecompile, null, null, metadata !14, i32 6} ; [ DW_TAG_subprogram ] [line 5] [local] [def] [scope 6] [Ecompile]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/kostas/workspace/test/grep-2.7/src/egrep.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{null, metadata !8, metadata !11}
!8 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!10 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!11 = metadata !{i32 786454, metadata !12, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!12 = metadata !{metadata !"/usr/local/bin/../lib/clang/3.5/include/stddef.h", metadata !"/home/kostas/workspace/test/grep-2.7/src"}
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16}
!15 = metadata !{i32 786689, metadata !4, metadata !"pattern", metadata !5, i32 16777221, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pattern] [line 5]
!16 = metadata !{i32 786689, metadata !4, metadata !"size", metadata !5, i32 33554437, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 5]
!17 = metadata !{metadata !18, metadata !36, metadata !40}
!18 = metadata !{i32 786484, i32 0, null, metadata !"matchers", metadata !"matchers", metadata !"", metadata !5, i32 10, metadata !19, i32 0, i32 1, [2 x %struct.matcher]* @matchers, null} ; [ DW_TAG_variable ] [matchers] [line 10] [def]
!19 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 384, i64 64, i32 0, i32 0, metadata !20, metadata !34, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 384, align 64, offset 0] [from ]
!20 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from matcher]
!21 = metadata !{i32 786451, metadata !22, null, metadata !"matcher", i32 30, i64 192, i64 64, i32 0, i32 0, null, metadata !23, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [matcher] [line 30, size 192, align 64, offset 0] [def] [from ]
!22 = metadata !{metadata !"./grep.h", metadata !"/home/kostas/workspace/test/grep-2.7/src"}
!23 = metadata !{metadata !24, metadata !25, metadata !28}
!24 = metadata !{i32 786445, metadata !22, metadata !21, metadata !"name", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ] [name] [line 32, size 64, align 64, offset 0] [from ]
!25 = metadata !{i32 786445, metadata !22, metadata !21, metadata !"compile", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !26} ; [ DW_TAG_member ] [compile] [line 33, size 64, align 64, offset 64] [from compile_fp_t]
!26 = metadata !{i32 786454, metadata !22, null, metadata !"compile_fp_t", i32 25, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ] [compile_fp_t] [line 25, size 0, align 0, offset 0] [from ]
!27 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!28 = metadata !{i32 786445, metadata !22, metadata !21, metadata !"execute", i32 34, i64 64, i64 64, i64 128, i32 0, metadata !29} ; [ DW_TAG_member ] [execute] [line 34, size 64, align 64, offset 128] [from execute_fp_t]
!29 = metadata !{i32 786454, metadata !22, null, metadata !"execute_fp_t", i32 26, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ] [execute_fp_t] [line 26, size 0, align 0, offset 0] [from ]
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!32 = metadata !{metadata !11, metadata !8, metadata !11, metadata !33, metadata !8}
!33 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ] [0, 1]
!36 = metadata !{i32 786484, i32 0, null, metadata !"before_options", metadata !"before_options", metadata !"", metadata !5, i32 15, metadata !37, i32 0, i32 1, [50 x i8]* @before_options, null} ; [ DW_TAG_variable ] [before_options] [line 15] [def]
!37 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 400, i64 8, i32 0, i32 0, metadata !9, metadata !38, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 400, align 8, offset 0] [from ]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 50}       ; [ DW_TAG_subrange_type ] [0, 49]
!40 = metadata !{i32 786484, i32 0, null, metadata !"after_options", metadata !"after_options", metadata !"", metadata !5, i32 17, metadata !41, i32 0, i32 1, [61 x i8]* @after_options, null} ; [ DW_TAG_variable ] [after_options] [line 17] [def]
!41 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 488, i64 8, i32 0, i32 0, metadata !9, metadata !42, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 488, align 8, offset 0] [from ]
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786465, i64 0, i64 61}       ; [ DW_TAG_subrange_type ] [0, 60]
!44 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!45 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!46 = metadata !{metadata !"clang version 3.5 (http://llvm.org/git/clang.git 9ac60551645be7a3c5f9b702159052f2f1a5b26a) (http://llvm.org/git/llvm.git 5e7eecd8509707a77a6b84c7879b947e14698ef0)"}
!47 = metadata !{i32 5, i32 0, metadata !4, null}
!48 = metadata !{i32 7, i32 0, metadata !4, null}
!49 = metadata !{i32 8, i32 0, metadata !4, null} ; [ DW_TAG_imported_declaration ]