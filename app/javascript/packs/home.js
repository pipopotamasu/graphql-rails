import ApolloClient from 'apollo-client';
import { ApolloLink } from 'apollo-link';
import { createHttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';
import gql from 'graphql-tag';


const csrfToken = document.querySelector('meta[name=csrf-token]').getAttribute('content');

const httpLink = createHttpLink({
  uri: '/graphql',
});

const middlewareLink = new ApolloLink((operation, forward) => {
  operation.setContext({
    headers: {
      'X-CSRF-Token': csrfToken
    }
  });
  return forward(operation)
})

// const authLink = setContext((_, { headers }) => {
//   // return the headers to the context so httpLink can read them
//   return {
//     headers: {
//       ...headers,
//       'X-CSRF-Token': csrfToken
//     }
//   }
// });

const client = new ApolloClient({
  link: middlewareLink.concat(httpLink),
  cache: new InMemoryCache()
});

client.query({
  query: gql`
    {
      post(id: 1) {
        id
        title
        comments {
          id,
          content,
        }
      }
    }
  `,
}).then(data => console.log(data)).catch(error => console.error(error));