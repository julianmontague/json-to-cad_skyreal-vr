# How to manage local Maven dependencies

## Install with [install:install-file](https://maven.apache.org/plugins/maven-install-plugin/install-file-mojo.html)

Install a file with `mvn org.apache.maven.plugins:maven-install-plugin:3.1.1:install-file -Dfile=</path/to/file>`, replacing `</path/to/file>` with the path to the JAR file you wish to install. (`3.1.1` should probably be replaced with the [latest version][maven-install-plugin]. See [this Maven Install Plugin example][fully-qualified] for an explanation why to use the fully qualified path.)

This method was suggested by [the Maven POM Reference](https://maven.apache.org/pom.html#dependencies).

### Installing only a POM file

Run the command
```
mvn org.apache.maven.plugins:maven-install-plugin:3.1.1:install-file \
-Dfile=</path/to/file> \
-Dpackaging=pom \
-DpomFile=</path/to/file>
```
replacing `</path/to/file>` with the path to the POM file you wish to install. I haven't tested, but I assume the `-Dpomfile` is required in order to determine its Maven coordinates (and thus where to install it).

This method was suggested [on StackOverflow](https://stackoverflow.com/questions/23739910/how-do-i-install-a-pom-in-my-local-m2-repository/23739948#23739948).

## Remove with [dependency:purge-local-repository](https://maven.apache.org/plugins/maven-dependency-plugin/purge-local-repository-mojo.html#manualInclude)

Remove a locally installed file with `mvn org.apache.maven.plugins:maven-dependency-plugin:3.6.1:purge-local-repository -DmanualInclude='<groupId>:<artifactId>'`, replacing `<groupId>` and `<artifactId>` with their respective values for the file you wish to remove. (`3.6.1` should probably be replaced with the [latest version][maven-dependency-plugin].)

This method was suggested [on StackOverflow][so-remove-jar-file], and is also described in [a Maven Dependency Plugin example, "Purging local repository dependencies"][manual-purge].

[maven-install-plugin]: https://maven.apache.org/plugins/maven-install-plugin/index.html
[fully-qualified]: https://maven.apache.org/plugins/maven-install-plugin/examples/custom-pom-installation.html
[maven-dependency-plugin]: https://maven.apache.org/plugins/maven-dependency-plugin/index.html
[so-remove-jar-file]: https://stackoverflow.com/questions/15358851/how-to-remove-jar-file-from-local-maven-repository-which-was-added-with-install/18105528#18105528
[manual-purge]: https://maven.apache.org/plugins/maven-dependency-plugin/examples/purging-local-repository.html#manual-purge
