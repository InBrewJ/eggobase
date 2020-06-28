# This intentionally mimics the flow of a makefile or Ant 'build.xml'

# Vars
JAVAC=/usr/lib/jvm/jdk1.8.0_202/bin/javac
SRC_DIR=./src
LOCAL_LIBS=./jars
STATIC_FILES=./WebContent
ARCHIVE_DIR=./warOut
CLASS_OUT=$ARCHIVE_DIR/WEB-INF/classes
OUT_WAR=./Eggobase.war

# clean
rm -f $OUT_WAR
rm -rf $ARCHIVE_DIR
mkdir $ARCHIVE_DIR
mkdir -p $CLASS_OUT

# copy static stuff
cp -r $STATIC_FILES/* $ARCHIVE_DIR

# compile
# Remember, $CATALINA_HOME must be exported...
$JAVAC \
    -classpath "$CATALINA_HOME/lib/*:$LOCAL_LIBS/*" \
    -d $CLASS_OUT \
    $(find $SRC_DIR -name "*.java")

# package
jar -cvf $OUT_WAR -C $ARCHIVE_DIR/ .

# remove archive dir again
rm -rf $ARCHIVE_DIR