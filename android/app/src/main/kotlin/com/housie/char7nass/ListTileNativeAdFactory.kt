package com.housie.char7nass

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import com.google.android.gms.ads.nativead.MediaView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class ListTileNativeAdFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val nativeAdView = LayoutInflater.from(context)
            .inflate(R.layout.list_tile_native_ad, null) as NativeAdView

        with(nativeAdView) {
            // Attribution Views
            val attributionViewSmall = findViewById<TextView>(R.id.tv_list_tile_native_ad_attribution_small)
            val attributionViewLarge = findViewById<TextView>(R.id.tv_list_tile_native_ad_attribution_large)

            // Media View
            val mediaView = findViewById<MediaView>(R.id.media_view)
            mediaView.setMediaContent(nativeAd.mediaContent)
            nativeAdView.mediaView = mediaView

            // Headline View
            val headlineView = findViewById<TextView>(R.id.tv_list_tile_native_ad_headline)
            headlineView.text = nativeAd.headline
            nativeAdView.headlineView = headlineView

            // Body View
            val bodyView = findViewById<TextView>(R.id.tv_list_tile_native_ad_body)
            bodyView.text = nativeAd.body
            bodyView.visibility = if (!nativeAd.body.isNullOrEmpty()) View.VISIBLE else View.INVISIBLE
            nativeAdView.bodyView = bodyView

            // Set the Native Ad to the View
            setNativeAd(nativeAd)
        }

        return nativeAdView
    }
}
