####################################################################################################
#                                              Build                                               #
####################################################################################################
# Ammonite
jar_library(name='ammonite', jars=[
    jar(org='com.lihaoyi', name='ammonite_2.12.1', rev='1.0.5'),
])

# Scala Compiler
jar_library(name='scala-compiler', dependencies=[':scala-library', ':scala-reflect'], jars=[
    jar(org='org.scala-lang', name='scala-compiler', rev='2.12.1'),
])

# Scala Library
jar_library(name='scala-library', jars=[
    jar(org='org.scala-lang', name='scala-library', rev='2.12.1'),
])

# Scala Reflection
jar_library(name='scala-reflect', jars=[
    jar(org='org.scala-lang', name='scala-reflect', rev='2.12.1', intransitive=True),
])
