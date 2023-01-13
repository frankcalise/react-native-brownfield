import React from "react";
import { Text, TextStyle, View, ViewStyle } from "react-native";

type Props = {
  scores: {
    name: string;
    value: string;
  }[];
};

const RNSuperModule = (props: Props) => {
  return (
    <View style={$container}>
      <View style={$row}>
        <View style={$textArea}>
          <Text>one</Text>
        </View>
        <View style={$textArea}>
          <Text>two</Text>
        </View>
      </View>
      <View style={$textArea}>
        <Text style={$text}>Props from native:</Text>
        <Text style={$props}>{JSON.stringify(props, null, 2)}</Text>
      </View>
    </View>
  );
};

export default RNSuperModule;

const $container: ViewStyle = {
  flex: 1,
  gap: 10,
  justifyContent: "center",
  alignItems: "center",
  backgroundColor: "#0000ff40",
};

const $row: ViewStyle = {
  flexDirection: "row",
  gap: 10,
};

const $textArea: ViewStyle = {
  backgroundColor: "#ff000040",
};

const $text: TextStyle = {
  fontSize: 20,
  textAlign: "center",
};

const $props: TextStyle = {
  marginTop: 10,
  color: "white",
};
