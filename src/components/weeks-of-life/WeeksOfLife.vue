<script setup lang="ts">
    import { defineModel, computed, watch } from 'vue'

    const age = defineModel({default: 26});
    const maxAge = 70;

    const weeksLived = computed(() => {
        return Math.round(age.value * 365.25 / 7);
    })

    const maxWeeks = Math.round(maxAge * 365.25 / 7);
</script>

<template>
    <div class="wrapper">
        <div class="input-wrap">
            <label for="age">Enter your age in years</label>
            <input
                type="number"
                v-model="age"
                min="1"
                name="age"
            >
        </div>
        <div class="weeks-container">
            <span
                v-for="(week, index) in Array(maxWeeks)"
                :key="index"
                class="week-cell"
                :class="{
                    'week-cell-lived': index < weeksLived
                }"
            >
            </span>
        </div>
    </div>

</template>

<style scoped lang="scss">
    .wrapper {
        display: flex;
        gap: 10px;
        flex-direction: column;
    }
    .input-wrap {
        display: flex;
        flex-direction: column;
        gap: 10px;
        align-items: center;
        justify-content: center;
        margin-bottom: 10px;

        & input {
            padding: 10px;
            border-radius: 10px;
            font-size: 16px;
        }
    }
    .weeks-container {
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
    }

    .week-cell {
        background-color: #ccc;
        width: 5px;
        height: 5px;
        border-radius: 6px;

        @media screen and (max-width: 781px) {
            width: 3px;
            height: 3px;
        }
    }

    .week-cell-lived {
        background-color: red;
    }
</style>