import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scbforparents/components/kabarseputar_scb.dart';

class GraphQL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer yNw9k6la9B3Q06h04menoajN6zNllx-ifEK1E8Ia5GU'
    );
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: authLink as Link,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );
    return GraphQLProvider(
      child: KabarSeputarSCB(),
      client: client,
    );
  }
}
