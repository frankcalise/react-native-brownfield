import { NavigationContainer } from "@react-navigation/native";
import {
  NativeStackScreenProps,
  createNativeStackNavigator,
} from "@react-navigation/native-stack";
import React from "react";
import {
  Text,
  TextStyle,
  TouchableOpacity,
  View,
  ViewStyle,
} from "react-native";

type FindParamList = {
  FindPage: undefined;
  FindContent: undefined;
};

type Props = {
  scores: {
    name: string;
    value: string;
  }[];
};

const StackNavigator = createNativeStackNavigator<FindParamList>();

export const FindPageScreen = ({
  navigation,
}: NativeStackScreenProps<FindParamList, "FindPage">) => {
  return (
    <View style={$container}>
      <View style={$row}>
        <View style={$textArea}>
          <Text>Find Page</Text>
          <TouchableOpacity
            style={$navLink}
            onPress={() => navigation.navigate("FindContent")}
          >
            <Text>Go to content</Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
};

export const FindContentScreen = () => {
  return (
    <View style={[$container, $findContentContainer]}>
      <View style={$row}>
        <View style={$textArea}>
          <Text>Find Content</Text>
        </View>
      </View>
    </View>
  );
};

// const FindPage = (props: Props) => {
//   return (
//     <NavigationContainer>
//       <StackNavigator.Navigator>
//         <StackNavigator.Screen name="FindPage" component={FindPageScreen} />
//         <StackNavigator.Screen
//           name="FindContent"
//           component={FindContentScreen}
//         />
//       </StackNavigator.Navigator>
//     </NavigationContainer>
//   )
// }

// export default FindPage

const $container: ViewStyle = {
  flex: 1,
  gap: 10,
  justifyContent: "center",
  alignItems: "center",
  backgroundColor: "#00ffff40",
};

const $findContentContainer: ViewStyle = {
  backgroundColor: "#00ff0040",
};

const $row: ViewStyle = {
  flexDirection: "row",
  gap: 10,
};

const $textArea: ViewStyle = {
  backgroundColor: "#ff000040",
  padding: 10,
};

const $text: TextStyle = {
  fontSize: 20,
  textAlign: "center",
};

const $navLink: ViewStyle = {
  padding: 10,
  backgroundColor: "#0000ff60",
  borderRadius: 5,
  borderWidth: 1,
  borderColor: "#000000",
  marginTop: 20,
};

const $props: TextStyle = {
  marginTop: 10,
  color: "white",
};
