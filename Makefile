
PRODUCT_PACKAGE_PATH := ./multi-module-sample
APOLLO_GENERATED_OUTPUT_PATH := ./$(PRODUCT_PACKAGE_PATH)/Sources/multi-module-sample/API/Generated

# help コマンド
.PHONY: help
help:
	@awk 'BEGIN {comment = ""} /^#/ {comment = substr($$0, 3)} /^[a-zA-Z0-9_-]+:/ {if (length(comment) > 0) {printf "%-40s %s\n", "make " substr($$0, 1, index($$0, ":")-1), comment; comment = ""}}' Makefile

# mint の初期化
.PHONY: mint-bootstrap
mint-bootstrap:
	swift run --package-path $(PRODUCT_PACKAGE_PATH) mint bootstrap

# SwiftFormat の実行
.PHONY: swiftformat-run
swiftformat-run:
	swift run --package-path $(PRODUCT_PACKAGE_PATH) mint run swiftformat ./


# GraphQL用のコード生成
# CLIはXcodeからmulti-module-sampleパッケージを右クリック > Install CLI > Run > Aollow で手動でインストール
.PHONY: apollo-ios-cli-generate
apollo-ios-cli-generate:
	$(PRODUCT_PACKAGE_PATH)/apollo-ios-cli generate --path $(PRODUCT_PACKAGE_PATH)/apollo-codegen-config.json