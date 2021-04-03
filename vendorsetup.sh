# SDClang Environment Variables
export SDCLANG_CONFIG=$(pwd)/vendor/one/sdclang/sdclang.json
for i in audio display media
do
    rm -rf vendor/qcom/defs/*/*/${i}-*mk hardware/qcom/${i}
done
mkdir -p $(pwd)/vendor/qcom/defs/board-defs/vendor
mkdir -p $(pwd)/vendor/qcom/defs/product-defs/vendor/
touch $(pwd)/vendor/qcom/defs/product-defs/vendor/dummy.mk
