package com.example.jivejournal

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform