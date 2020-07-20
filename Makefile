JAVA_HOME:=/opt/java/jdk-14.0.2/
export PATH:=${JAVA_HOME}/bin:${PATH}

.PHONY: all
all:
	javac --enable-preview -source 14 -target 14 *.java
