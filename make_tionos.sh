#!/bin/bash
OLD_NAME="tion"
NEW_NAME="tion"
CODENAME="merlinx"

echo "🚀 Перетворюємо дерево в TionOS..."

# Заміна тексту всередині файлів
find . -type f -not -path '*/.*' -exec sed -i "s/$OLD_NAME/$NEW_NAME/g" {} +
find . -type f -not -path '*/.*' -exec sed -i "s/TionOS/TionOS/g" {} +

# Перейменування файлів
find . -name "*$OLD_NAME*" -exec bash -c 'mv "$1" "${1//'$OLD_NAME'/'$NEW_NAME'}"' -- {} \;

# Оновлення AndroidProducts.mk
echo "PRODUCT_MAKEFILES := \$(LOCAL_DIR)/${NEW_NAME}_${CODENAME}.mk" > AndroidProducts.mk

echo "✅ Готово! Файли перейменовано під TionOS."
