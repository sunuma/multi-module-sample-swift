# multi-module-sample-swift

## 概要
- apollo-iosを使用してGraphQLのAPIコードを自動生成する処理を実装（makeコマンド実行時に自動生成されるように変更予定）

### Apollo iOS CLI 導入 〜 APIコード自動生成
multi-module-sampleパッケージを右クリック > Install CLI > Run > Aollow
```
$ cd multi-module-sampleパッケージのパス
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
$ cd multi-module-sampleパッケージのパス
$ apollo-ios-cli fetch-schema
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
