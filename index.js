import React from "react";
import { AppRegistry, Text, View } from "react-native";
import App from "./src/App";
import FindPage from "./src/FindPage";

// ! this registered name is important here, will be used on the native side
AppRegistry.registerComponent("RNSuperModule", () => App);
AppRegistry.registerComponent("DragonFly", () => App);

// register FindPage here
// AppRegistry.registerComponent("FindPage", () => FindPage);
