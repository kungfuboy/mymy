<template>
  <div class="container">
    <div class="price up">
      <span v-for="it in countUp" :key="it.label"
        >{{ it.label | upFilter }} <b>￥{{ it.price }}</b></span
      >
    </div>
    <div>
      <NewItem @on-update="handleChange" />
      <br />
      <div>
        <b-form-input
          types="number"
          placeholder="How many you want to buy"
          v-model="count"
        ></b-form-input>
        <br />
        <span>Need: ￥{{ countNeed }}</span>
      </div>
    </div>
    <div class="price down">
      <span v-for="it in countDown" :key="it.label"
        ><b>￥{{ it.price }}</b> {{ it.label | downFilter }}
      </span>
    </div>
  </div>
</template>

<script>
const countUp = [1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09, 1.1]
const countDown = [0.99, 0.98, 0.97, 0.96, 0.95, 0.94, 0.93, 0.92, 0.91, 0.9]
export default {
  data: () => ({
    value: 0,
    count: 100,
  }),
  computed: {
    countUp() {
      return countUp.map((it) => ({
        label: it,
        price: (it * this.value).toFixed(2),
      }))
    },
    countDown() {
      return countDown.map((it) => ({
        label: it,
        price: (it * this.value).toFixed(2),
      }))
    },
    countNeed() {
      return (this.value * this.count).toFixed(2)
    },
  },
  methods: {
    handleChange(value) {
      this.value = value
    },
  },
  filters: {
    upFilter(val) {
      return ((val - 1) * 100).toFixed(2) + '%'
    },
    downFilter(val) {
      return ((val - 1) * 100).toFixed(2) + '%'
    },
  },
}
</script>

<style lang="stylus" scoped>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.price {
  display: flex;
  padding: 0 50px;
  width: 340px
  flex-direction: column;
  span {
    height 40px;
    line-height 40px;
    color: #999
    &:nth-child(5) {
      height 50px;
      line-height 50px;
      font-size 25px;
    }
    b {
      margin: 0 15px;
    }
  }
  &.up {
    text-align right
    b {
      color: red
    }
  }
  &.down {
    text-align left
    b {
      color: green
    }
  }
}
</style>
