---
topic: "Spark Java"
desc: "A micro framework for creating web applications in Java 8 with minimal effort"
---

Spark is, according to its website (quote retrieved on 6/20/2016):

> A micro framework for creating web applications in Java 8 with minimal effort

# SparkJava != Apache Spark

SparkJava, the micro framework for webapps,  *should not be confused with* [Apache Spark](https://spark.apache.org/docs/0.9.1/java-programming-guide.html) which is a "fast and general-purpose cluster computing system" with libraries, for, among
other things, machine learning.    That's a whole other subject.

# References

* Main web page for SparkJava: <http://sparkjava.com/>
* SparkJava API Documentation: <http://sparkjava.com/documentation.html>
* javadoc (unofficial, see note below) <https://ucsb-cs56-pconrad.github.io/spark/target/site/apidocs/index.html>

# Note on the "unofficial" javadoc link above

Annoyingly, the Spark Java project doesn't maintain up-to-date javadoc online.  Instead, they invite the user to 
* fork their repo
* run `mvn javadoc:javadoc`
* view the generated javadoc in  `/target/site/apidocs`

To save you (and me) the trouble the next time we just want to look something up, I forked the repo <https://github.com/perwendel/spark> to <https://github.com/UCSB-CS56-pconrad/spark> on 06/20/2016, ran `mvn javadoc:javadoc`, updated
the .gitignore to not ignore /target/site/apidocs, and then commited the result to a gh-pages branch.  So now, you can
see the generated javadoc here:

<https://ucsb-cs56-pconrad.github.io/spark/target/site/apidocs/index.html>
