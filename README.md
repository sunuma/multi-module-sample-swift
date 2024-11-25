# multi-module-sample-swift

- マルチモジュール、マルチパッケージ構成のサンプル実装
- Clean Architectureで実装
- GraphQL（apollo-iosを使ってコードを自動生成）

### Apollo iOS CLI 導入からコードの自動生成までの手順
multi-module-sampleパッケージを右クリック > Install CLI > Run > Aollow
```
$ cd {project root path}/multi-module-sample
$ ./apollo-ios-cli init --schema-namespace SW --module-type embeddedInTarget --target-name multi-module-sample
```
生成されたapollo-codegen-config.jsonに以下を追記
```
"schemaDownloadConfiguration": {
  "downloadMethod": {
    "introspection": {
      "endpointURL": "https://swapi-graphql.netlify.app/.netlify/functions/index",
      "includeDeprecatedInputValues": false,
      "httpMethod": {
        "POST": {}
      },
      "outputFormat": "JSON"
    }
  },
  "outputPath": "./schema.json"
}
```
JSON形式のスキーマを取得
```
$ cd {project root path}/multi-module-sample
$ ./apollo-ios-cli fetch-schema
```
apollo-codegen-config.jsonを編集しスキーマのパスと出力先を更新
```
"schemaSearchPaths" : [
  "./schema.json"
]
```
```
"schemaTypes" : {
  "path" : "./Sources/multi-module-sample/API/Generated",
  "moduleType" : {
    "embeddedInTarget" : {
      "name" : "multi-module-sample"
    }
  }
},
```
