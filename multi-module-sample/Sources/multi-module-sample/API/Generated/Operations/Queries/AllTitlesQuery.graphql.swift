// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension SW {
  class AllTitlesQuery: GraphQLQuery {
    static let operationName: String = "AllTitles"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query AllTitles { allFilms { __typename films { __typename title } } }"#
      ))

    public init() {}

    struct Data: SW.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { SW.Objects.Root }
      static var __selections: [ApolloAPI.Selection] { [
        .field("allFilms", AllFilms?.self),
      ] }

      var allFilms: AllFilms? { __data["allFilms"] }

      /// AllFilms
      ///
      /// Parent Type: `FilmsConnection`
      struct AllFilms: SW.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { SW.Objects.FilmsConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("films", [Film?]?.self),
        ] }

        /// A list of all of the objects returned in the connection. This is a convenience
        /// field provided for quickly exploring the API; rather than querying for
        /// "{ edges { node } }" when no edge data is needed, this field can be be used
        /// instead. Note that when clients like Relay need to fetch the "cursor" field on
        /// the edge to enable efficient pagination, this shortcut cannot be used, and the
        /// full "{ edges { node } }" version should be used instead.
        var films: [Film?]? { __data["films"] }

        /// AllFilms.Film
        ///
        /// Parent Type: `Film`
        struct Film: SW.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { SW.Objects.Film }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", String?.self),
          ] }

          /// The title of this film.
          var title: String? { __data["title"] }
        }
      }
    }
  }

}