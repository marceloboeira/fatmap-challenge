# Comments
> Some random thoughts and explanations

The challenge is quite nice and straight forward. I would say it was very easy to bootstrap and get something done.

## Implementation

My first, and given the 2 hours constraint, only implementation basically ignores abstractions, besides the simple isolation of the data concern and the application usage, and focuses on implementig the first given assignment: search.

### Stack

The stack decision was purely based on the time constraint vs my most productive skill set.

For example, if one of the requirements was performance, scalability or even concurrency, I would use something like Scala. (I have a few examples for other very similar assignments but with other requirements, let me know if you want to check that out).

### "Design"

The implementation from "application" is just consuming content and behavior from "OffPiste" object and pointing to the "production" dataset.

The OffPiste class has a lot of responsabilities, which is not good. It reads the file, parses it, and implements content consumption, like the logic for the keys of the json file and also the search behavior.

### Search

About the search, it is very simple, but it already matches partial content, regardless of the position, and also full match. Both case insensitive. I am using a very basic regexp to do that.

### Tests

The OffPiste tests are covering the loading, item fetch and search, on a isolated unit level.

The application tests hit the endpoint as production would, so, not so good separation of responsability and it is not so easy to inject the behavior of the OffPiste "service". That would be something to do in order to create the distinction and improve the tests. Yet, right now they are testing the columns returns for the item, the search results and the staatus... some failing scenarios could have been testes, like special chars, missing params, wrong endpoints and so on.

## Future

Given another 2 hours, I would tackle:
  - Create better 'integration tests' / concern distinctions
  - Implement sorting/filtering for the given parameters
  - Basic FE with a simple autosuggest based on top results (e.g.: https://codepen.io/moroshko/pen/PZWbzK)
  - Present the HTML canvas object for the selected item on the autosuggest
  - Create better abstractions

## Real world

On a real world scenario, it would depend on several factors, but Elastic Search could be a very nice resource, given its search flexibility and scalability for gazillion of documents and so on.
