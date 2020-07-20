# Demo for a bug in the Java Compiler record classes

Compiling this class

```java
record RecordClass() {
    @SuppressWarnings("foo")
    private static final int FIELD = 42;
}
```

with OpenJDK 14.0.2 results in the following stack trace:

```
java.lang.NullPointerException
        at jdk.compiler/com.sun.tools.javac.comp.Check.validateAnnotation(Check.java:2912)
        at jdk.compiler/com.sun.tools.javac.comp.Check.validateAnnotations(Check.java:2868)
        at jdk.compiler/com.sun.tools.javac.comp.Annotate.lambda$annotateLater$1(Annotate.java:279)
        at jdk.compiler/com.sun.tools.javac.comp.Annotate.flush(Annotate.java:200)
        at jdk.compiler/com.sun.tools.javac.comp.Annotate.unblockAnnotations(Annotate.java:144)
        at jdk.compiler/com.sun.tools.javac.comp.Annotate.enterDone(Annotate.java:157)
        at jdk.compiler/com.sun.tools.javac.main.JavaCompiler.enterDone(JavaCompiler.java:1752)
        at jdk.compiler/com.sun.tools.javac.main.JavaCompiler.enterTrees(JavaCompiler.java:1073)
        at jdk.compiler/com.sun.tools.javac.main.JavaCompiler.compile(JavaCompiler.java:936)
        at jdk.compiler/com.sun.tools.javac.main.Main.compile(Main.java:316)
        at jdk.compiler/com.sun.tools.javac.main.Main.compile(Main.java:176)
        at jdk.compiler/com.sun.tools.javac.Main.compile(Main.java:57)
        at jdk.compiler/com.sun.tools.javac.Main.main(Main.java:43)
```

The bug is reported to Oracle with review id 9066059.
