import { NavigationContainer } from "@react-navigation/native";
import {
  NativeStackScreenProps,
  createNativeStackNavigator,
} from "@react-navigation/native-stack";
import React from "react";
import { Text, TextStyle, View, ViewStyle } from "react-native";
import { FindContentScreen, FindPageScreen } from "./FindPage";

type ScreenProps = {
  scores: {
    name: string;
    value: string;
  }[];
};

type Props = {
  initialRouteName: keyof SuperModuleParamList;
  screenProps?: ScreenProps;
};

type SuperModuleParamList = {
  SuperModule: { props: ScreenProps };
  FindPage: undefined;
  FindContent: undefined;
};

const StackNavigator = createNativeStackNavigator<SuperModuleParamList>();

const SuperModuleScreen = ({
  route,
}: NativeStackScreenProps<SuperModuleParamList, "SuperModule">) => {
  const { props } = route.params;
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
        <Text style={$props}>{JSON.stringify(props ?? "", null, 2)}</Text>
      </View>
    </View>
  );
};

const RNSuperModule = (props: Props) => {
  return (
    <NavigationContainer>
      <StackNavigator.Navigator initialRouteName={props.initialRouteName}>
        <StackNavigator.Screen
          name="SuperModule"
          component={SuperModuleScreen}
          initialParams={{ props: props.screenProps }}
        />
        <StackNavigator.Screen name="FindPage" component={FindPageScreen} />
        <StackNavigator.Screen
          name="FindContent"
          component={FindContentScreen}
        />
      </StackNavigator.Navigator>
    </NavigationContainer>
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
