import React from "react";
import { Text, TextStyle, View, ViewStyle } from "react-native";

type Props = {
  scores: {
    name: string;
    value: string;
  }[];
};

const FindPage = (props: Props) => {
  return (
    <View style={$container}>
      <View style={$row}>
        <View style={$textArea}>
          <Text>Find Page</Text>
        </View>
      </View>
    </View>
  );
};

export default FindPage;

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
