// import ApolloClient from "apollo-client";
// import { ApolloLink } from "apollo-link";
// import { createHttpLink } from "apollo-link-http";
// import { InMemoryCache } from "apollo-cache-inmemory";
// import gql from "graphql-tag";

// const csrfToken = document
//   .querySelector("meta[name=csrf-token]")
//   .getAttribute("content");

// const httpLink = createHttpLink({
//   uri: "/graphql",
//   credentials: "same-origin"
// });

// const middlewareLink = new ApolloLink((operation, forward) => {
//   operation.setContext({
//     headers: {
//       "X-CSRF-Token": csrfToken
//     }
//   });
//   return forward(operation);
// });

// const client = new ApolloClient({
//   link: middlewareLink.concat(httpLink),
//   cache: new InMemoryCache()
// });

// const fetchQuery = gql`
//   query {
//     post(id: 1) {
//       id
//       title
//       comments {
//         id
//         content
//         postId
//       }
//     }
//   }
// `;

// const createPostQuery = gql`
//   mutation {
//     createPostMutation(input: { title: "良い感じ！" }) {
//       post {
//         id
//         title
//       }
//     }
//   }
// `;

// const createCommentQuery = gql`
//   mutation {
//     createCommentMutation(input: { content: "foo", postId: 4 }) {
//       comment {
//         id
//         content
//         postId
//       }
//     }
//   }
// `;

// client.query({
//   query: fetchQuery,
// }).then(data => console.log(data)).catch(error => console.error(error));

// client.mutate({
//   mutation: createPostQuery,
// }).then(data => console.log(data)).catch(error => console.error(error));

// client.mutate({
//   mutation: createCommentQuery,
// }).then(data => console.log(data)).catch(error => console.error(error));
