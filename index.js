import React from "react";
import { AppRegistry, Text, View } from "react-native";

const RNSuperModule = (props) => {
  return (
    <View style={$container}>
      <Text style={$text}>Props from native:</Text>
      <Text style={$props}>{JSON.stringify(props, null, 2)}</Text>
    </View>
  );
};

const $container = {
  flex: 1,
  justifyContent: "center",
  alignItems: "center",
  backgroundColor: "blue",
};

const $text = {
  fontSize: 20,
  textAlign: "center",
  color: "white",
};

const $props = {
  marginTop: 10,
  color: "white",
};

// ! this registered name is important here, will be used on the native side
AppRegistry.registerComponent("RNSuperModule", () => RNSuperModule);
