# Continuous Integration

* <https://martinfowler.com/articles/continuousIntegration.html>
    * Work on main and frequently push.
    * Code-review later.
    * Fix integration bugs caused by the merge to main (but catch them earlier than feature-based merges).
    * <https://martinfowler.com/delivery.html>
    * Could Use a 'pending head' to run CI on a branch before merging to main, to avoid potengtially breaking everyone's build.  But is that really needed?  https://martinfowler.com/bliki/PendingHead.html (old and pre-Git)
* <https://www.thoughtworks.com/continuous-integration>
* <https://trunkbaseddevelopment.com/>
  > You should do Trunk-Based Development instead of GitFlow and other branching models that feature multiple long-running branches
  > 
  > You can either do a direct to trunk commit/push (v small teams) or a Pull-Request workflow as long as those feature branches are short-lived and the product of a single person.
