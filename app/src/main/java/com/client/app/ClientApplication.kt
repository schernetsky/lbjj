/*
 * Copyright 2016 <CLIENT_NAME>. All rights reserved.
 *
 * Created by randy on 09/14/2016.
 */

package com.client.app

import android.app.Application
import android.app.FragmentManager
import android.content.Context
import android.os.StrictMode
import android.support.v7.app.AppCompatDelegate

import com.squareup.leakcanary.LeakCanary
import com.squareup.leakcanary.RefWatcher

fun ClientApplication_watchReference(context: Context) {
    ClientApplication_watchReference(context, context)
}

fun ClientApplication_watchReference(context: Context, reference: Any) {
    (context.applicationContext as ClientApplication).refWatcher.watch(reference)
}

class ClientApplication : Application() {

    init {
        AppCompatDelegate.setCompatVectorFromResourcesEnabled(true)
    }

    lateinit var refWatcher: RefWatcher
        private set

    override fun onCreate() {
        super.onCreate()

        FragmentManager.enableDebugLogging(BuildConfig.DEBUG)

        // starting LeakCanary
        refWatcher = LeakCanary.install(this)

        if (BuildConfig.DEBUG) {
            StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.Builder()
                    .detectAll()
                    .penaltyLog()
                    .build())
            StrictMode.setVmPolicy(StrictMode.VmPolicy.Builder()
                    .detectAll()
                    .penaltyLog()
                    .build())
        }
    }
}
