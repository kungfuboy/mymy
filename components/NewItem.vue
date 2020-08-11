<template>
  <div>
    <b-input-group size="lg" prepend="￥">
      <b-form-input
        types="number"
        placeholder="Enter your price"
        v-model="price"
        @update="handleChange"
      ></b-form-input>
    </b-input-group>
  </div>
</template>

<script>
export default {
  name: 'NewItem',
  data: () => ({
    price: 0,
  }),
  methods: {
    handleChange(val) {
      this.$emit('on-update', val)
    },
  },
}
</script>

<style></style>
