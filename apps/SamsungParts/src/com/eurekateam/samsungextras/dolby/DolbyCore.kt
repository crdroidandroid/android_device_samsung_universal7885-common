package com.eurekateam.samsungextras.dolby

import android.media.audiofx.AudioEffect
import java.util.*

class DolbyCore {
    private var currentProfile : Int = -1
    private val audioEffect = AudioEffect(
        EFFECT_TYPE_DAP, AudioEffect.EFFECT_TYPE_NULL, 0, 0
    )
    fun startDolbyEffect(PROFILE: Int){
        audioEffect.setParameter(EFFECT_PARAM_EFF_ENAB, 1)
        audioEffect.setParameter(EFFECT_PARAM_PROFILE, PROFILE)
        currentProfile = PROFILE
        audioEffect.enabled = true
    }
    fun stopDolbyEffect(){
        audioEffect.enabled = false
    }
    fun isRunning (): Boolean {
        return audioEffect.enabled
    }
    fun justStartOnly(){
        audioEffect.enabled = true
    }

    fun currentState(): Int{
        return currentProfile
    }
    companion object {

        private val EFFECT_TYPE_DAP = UUID.fromString("46d279d9-9be7-453d-9d7c-ef937f675587")

        private const val EFFECT_PARAM_PROFILE = 0
        private const val EFFECT_PARAM_EFF_ENAB = 19

        const val PROFILE_AUTO = 0
        const val PROFILE_MOVIE = 1
        const val PROFILE_MUSIC = 2
        const val PROFILE_VOICE = 3
        const val PROFILE_GAME = 4
        const val PROFILE_OFF = 5
        const val PROFILE_GAME_1 = 6
        const val PROFILE_GAME_2 = 7
        const val PROFILE_SPACIAL_AUDIO = 8
    }
}