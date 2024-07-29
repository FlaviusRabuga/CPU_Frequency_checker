#include <stdio.h>              // for printf
#include <unistd.h>             // for sleep
#include <time.h>               // for clock_gettime
#define _POSIX_C_SOURCE 199309L // for struct timespec

#define SAMPLING_INTERVAL 1     // in seconds, how often to sample the frequency
#define SPIN_COUNT 2000
#define SPINS_PER_LOOP 50

extern void SpinALot(int spinCount);


double getElapsedTime(const struct timespec start) {
    struct timespec stop;
    clock_gettime(CLOCK_MONOTONIC, &stop);

    double start_sec = start.tv_sec + start.tv_nsec / 1e9;
    double stop_sec = stop.tv_sec + stop.tv_nsec / 1e9;
    return stop_sec - start_sec;
}

float measureFrequencyOnce() {
    struct timespec start;
    clock_gettime(CLOCK_MONOTONIC, &start);
    SpinALot(SPIN_COUNT);
    double elapsed = getElapsedTime(start);

    float frequency = ((SPIN_COUNT * SPINS_PER_LOOP) / elapsed) / 1e6;
    return frequency;
}

float measureFrequency(int iterations) {
    float averageFrequency = 0.0f;
    for (int i = 0; i < iterations; ++i) {
        averageFrequency += measureFrequencyOnce();
    }
    return averageFrequency / iterations;
}


int main() {
    
    for (int i = 0; i < 1000; i++) {
        double frequency = measureFrequency(600);
        printf("CPU Frequency: %f\n", frequency);
        sleep(1);
    }
    
    return 0;
}
