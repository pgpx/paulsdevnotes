# gitgraphjs

* <https://gitgraphjs.com/>
* <https://gitgraphjs.com/v1/docs/>

```java


// @gitgraph/js − Pass `options` as second param
const gitgraph = createGitgraph(graphContainer, options);

options.orientation
With "vertical-reverse"

options.orientation
With "horizontal"

new-feature
master
You also have "horizontal-reverse"

options.template
You can create your own with templateExtend():

const options = {
  template: templateExtend("metro", {
    colors: ["red", "blue", "orange"],
    // …
  }),
};
v1.0
new-feature
master
v2.0
options.mode
You can opt-in "compact"

It renders commit messages in tooltips

Create branch with options
gitgraph.branch({
  name: "develop",
  style: {
    // Specific style for this branch
  },
});
Create commit with options
master.commit({
  subject: "Add feature",
  body: "More details about the feature…",
  dotText: "❤️",
  tag: "v1.2",
  style: {
    // Specific style for this commit
  },
});
Merge branch with options
master.merge({
  branch: develop,
  fastForward: true,
  commitOptions: {
    // Every valid `options` for a commit
  },
});
Add event listeners on commits
master.commit({
  subject: "Add tests",
  onMessageClick(commit) {
    alert(`Commit ${commit.hash} selected`);
  },
});
But also: onMouseOver, onMouseOut, etc.

Check detailed use-cases 🧐
JS stories of @gitgraph/js
React stories of @gitgraph/react
Thank you 🤗
To our contributors:

List of contributors images



Chromatic QA for helping catching visual regressions.

Do you like George Michael? 🎷




```
```java


options.template
        With "blackarrow"
        
        
        
gitgraph.branch({
        name: "develop",
        style: {
        // Specific style for this branch
        },
        });

master.commit({
        subject: "Add feature",
        body: "More details about the feature…",
        dotText: "❤️",
        tag: "v1.2",
        style: {
        // Specific style for this commit
        },
        });

master.merge({
  branch: develop,
  fastForward: true,
  commitOptions: {
    // Every valid `options` for a commit
  },
});
```