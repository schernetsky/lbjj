# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/randy/Development/Android/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

## retain line numbers for reported stack traces
-flattenpackagehierarchy
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

## warnings
-dontwarn javax.annotation.**
-dontwarn sun.misc.**

## attributes
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes Exceptions
-keepattributes InnerClasses
-keepattributes Signature

## kotlin
-dontwarn kotlin.**
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}
-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    static void checkParameterIsNotNull(java.lang.Object, java.lang.String);
}

## view constructors
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int, int);
}

## parcelables
-keepnames class * implements android.os.Parcelable {
    public static final ** CREATOR;
}

## android support
-dontwarn android.support.**
-keep class android.support.v7.widget.SearchView { *; }

## google play services
-dontwarn com.google.**
-keep class com.google.android.gms.wearable.** { *; }
-keep class com.google.api.services.** { *; }
-keep class * extends java.util.ListResourceBundle {
    protected Object[][] getContents();
}
-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
    public static final *** NULL;
}

## glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

## injection
-dontwarn javax.inject.**
-keep class **$$Factory { *; }
-keep class **$$MemberInjector { *; }
-keepnames @javax.inject.Singleton class *
-keepnames class * {
    @javax.inject.Inject <init>(...);
    @javax.inject.Inject <fields>;
}

## leak canary
-dontwarn com.squareup.leakcanary.**

## moshi
-dontwarn com.squareup.moshi.**
-keep @com.squareup.moshi.JsonQualifier interface *
-keepclasseswithmembers class * {
    @com.squareup.moshi.* <methods>;
}

## reactivex
-dontnote io.reactivex.**
-dontwarn io.reactivex.internal.**

## retrofit
-dontwarn okio.**
-dontwarn okhttp3.**
-dontnote retrofit2.**
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepclassmembers class ** {
  @retrofit2.http.* public *;
}
