# 保留某些类不被混淆（如果需要）
# -keep class com.yourcompany.yourplugin.** { *; }

# 如果你用了 Gson 或其他序列化库
# -keepattributes Signature
# -keepattributes *Annotation*

# Flutter 插件通常会自动添加规则，你一般不需要写太多