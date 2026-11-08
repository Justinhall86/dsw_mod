{
	"type": "fx",
	"cullingRadius": 25,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"rotationZ": 90,
			"children": [
				{
					"type": "model",
					"name": "BaseEcaz",
					"source": "Structure/Base/Ecaz/Ecaz_MainBase.fbx",
					"editorOnly": true,
					"locked": true,
					"lockAnimation": true,
					"children": [
						{
							"type": "model",
							"name": "RIG_BaseArrakeen_Ships",
							"source": "Structure/Base/Arrakeen/RIG_BaseArrakeen_Ships.fbx",
							"locked": true,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Structure/Base/Arrakeen/Anim_BaseArrakeen_Ships.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "RIG_BaseArrakeen_Doors",
							"source": "Structure/Base/Arrakeen/RIG_BaseArrakeen_Doors.fbx",
							"locked": true,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Structure/Base/Arrakeen/Anim_BaseArrakeen_Doors.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Drones",
					"z": 7.12795,
					"children": [
						{
							"type": "emitter",
							"name": "OrbitalDronesReactors",
							"props": {
								"emitShape": "Cylinder",
								"instScale_rand": 0.8,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitRad2": 0.49,
								"lifeTime": 10000000,
								"instOrbitSpeed_rand": [
									0,
									0,
									0.4
								],
								"emitRad1": 1.3,
								"emitOrientation": "Speed",
								"emitRate": 18,
								"simulationSpace": "World",
								"alignAxis": [
									10,
									0,
									0
								],
								"instRotation": [
									0,
									0,
									180
								],
								"maxCount": 18,
								"instScale": 2,
								"speedFactor": 0.7,
								"emitAngle": 360,
								"emitSurface": true
							},
							"scaleX": 24,
							"scaleY": 24,
							"scaleZ": 7.5,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"x": 0.05,
									"scaleX": 0.3,
									"scaleY": 0.1,
									"scaleZ": 0.2,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 20
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.15,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad3.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.403921568627451,
													0.7764705882352941,
													1
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "OrbitalDrones",
							"props": {
								"emitShape": "Cylinder",
								"instScale_rand": 0.8,
								"instWorldAcceleration_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"emitRad2": 0.49,
								"lifeTime": 10000000,
								"instOrbitSpeed_rand": [
									0,
									0,
									0.4
								],
								"emitRad1": 1.3,
								"emitOrientation": "Speed",
								"emitRate": 18,
								"simulationSpace": "World",
								"alignAxis": [
									10,
									0,
									0
								],
								"instRotation": [
									0,
									0,
									180
								],
								"maxCount": 18,
								"instScale": 2,
								"speedFactor": 0.7,
								"emitAngle": 360,
								"emitSurface": true
							},
							"scaleX": 24,
							"scaleY": 24,
							"scaleZ": 7.5,
							"children": [
								{
									"type": "model",
									"name": "SM_Drone01",
									"source": "Fx/Structure/Arrakeen/SM_Drone01.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "Smoke ",
					"x": 4.694242424242425,
					"y": -0.851022727272727,
					"z": -5.332083333333332,
					"children": [
						{
							"type": "reference",
							"name": "FX_Smoke",
							"source": "Fx/Smoke/FX_Smoke_Soft_3.fx",
							"enabled": false,
							"x": 7.85,
							"y": -12.78,
							"z": 3.45,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 2,
							"rotationX": -14,
							"rotationY": 13.4,
							"rotationZ": -97.7
						},
						{
							"type": "reference",
							"name": "FX_Smoke",
							"source": "Fx/Smoke/FX_Smoke_Big_1.fx",
							"enabled": false,
							"x": 11.65,
							"y": 10.54,
							"z": 1.98,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.8,
							"rotationX": 15.6,
							"rotationY": -12.5,
							"rotationZ": 21.5
						},
						{
							"type": "reference",
							"name": "FX_Smoke",
							"source": "Fx/Smoke/FX_Smoke_Soft_3.fx",
							"x": 4.08663,
							"y": -4.11436,
							"z": 12.05958,
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 2.7,
							"rotationZ": -95,
							"children": [
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "reference",
							"name": "FX_Smoke",
							"source": "Fx/Smoke/FX_Smoke_Soft_3.fx",
							"x": -13.86104,
							"y": -4.28187,
							"z": 12.05958,
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 2.7,
							"rotationZ": -95,
							"children": [
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "reference",
							"name": "FX_Smoke",
							"source": "Fx/Smoke/FX_Smoke_Big_1.fx",
							"enabled": false,
							"x": 14.79,
							"y": 3.13,
							"z": 1.62,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.7,
							"rotationX": 2.6,
							"rotationY": -8.8,
							"rotationZ": 8.5
						},
						{
							"type": "reference",
							"name": "FX_Smoke",
							"source": "Fx/Smoke/FX_Smoke_Big_1.fx",
							"enabled": false,
							"x": -9.42,
							"y": 0.93,
							"z": 2.96,
							"scaleZ": 1.3,
							"rotationX": -5.5,
							"rotationY": 0.9,
							"rotationZ": -76.2
						},
						{
							"type": "reference",
							"name": "FX_Smoke",
							"source": "Fx/Smoke/FX_Smoke_Big_1.fx",
							"enabled": false,
							"x": -14.62,
							"y": 1.82,
							"z": 2.93,
							"scaleZ": 1.3,
							"rotationX": -5.5,
							"rotationY": 0.9,
							"rotationZ": -37.7
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						}
					]
				},
				{
					"type": "object",
					"name": "Lights",
					"x": 0.012685000000000094,
					"y": 4.224055,
					"z": 9.64272,
					"children": [
						{
							"type": "object",
							"name": "antenne",
							"x": 1.3169149999999998,
							"y": 5.2147950000000005,
							"z": -6.78495,
							"scaleX": 1.0000000000000007,
							"scaleY": 1.0000000000000007,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes-flare",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -0.41054,
									"scaleX": 1.5,
									"scaleZ": 0.43,
									"rotationZ": -45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.34728581392308433,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.37669553614530665,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.3493865083675288,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.3535878972564177,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.36199067503419546,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.33258095281197314,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.2,
										"power": 0.8
									}
								},
								{
									"type": "subFX",
									"name": "LightBlue02_Flat",
									"source": "Fx/Structure/Lights/LightBlue02_Flat.fx",
									"y": -0.06335,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 4.5,
									"rotationX": 90,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "antenne",
							"x": 1.375695,
							"y": 5.2147950000000005,
							"z": 1.2434199999999986,
							"scaleX": 1.0000000000000007,
							"scaleY": 1.0000000000000007,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes-flare",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -0.41054,
									"scaleX": 1.5,
									"scaleZ": 0.43,
									"rotationZ": -45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.34728581392308433,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.37669553614530665,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.3493865083675288,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.3535878972564177,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.36199067503419546,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.33258095281197314,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.2,
										"power": 0.8
									}
								},
								{
									"type": "subFX",
									"name": "LightBlue02_Flat",
									"source": "Fx/Structure/Lights/LightBlue02_Flat.fx",
									"y": -0.06335,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 4.5,
									"rotationX": 90,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "antenne",
							"x": -1.333645,
							"y": 5.254524999999999,
							"z": -6.78495,
							"scaleX": 1.0000000000000007,
							"scaleY": 1.0000000000000007,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes-flare",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -0.41054,
									"scaleX": 1.5,
									"scaleZ": 0.43,
									"rotationZ": -45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.34728581392308433,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.37669553614530665,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.3493865083675288,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.3535878972564177,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.36199067503419546,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.33258095281197314,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.2,
										"power": 0.8
									}
								},
								{
									"type": "subFX",
									"name": "LightBlue02_Flat",
									"source": "Fx/Structure/Lights/LightBlue02_Flat.fx",
									"y": -0.00983,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 4.5,
									"rotationX": -89.99999999999999,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "antenne",
							"x": 5.360715,
							"y": -10.425365,
							"z": 5.54153,
							"scaleX": 1.0000000000000004,
							"scaleY": 1.0000000000000004,
							"rotationZ": -62.6,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes-flare",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -0.41054,
									"scaleX": 1.5,
									"scaleZ": 0.43,
									"rotationZ": -50.3,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.34728581392308433,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.37669553614530665,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.3493865083675288,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.3535878972564177,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.36199067503419546,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.33258095281197314,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.2,
										"power": 0.8
									}
								},
								{
									"type": "subFX",
									"name": "LightBlue02_Flat",
									"source": "Fx/Structure/Lights/LightBlue02_Flat.fx",
									"y": -0.00983,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 4.5,
									"rotationX": -90,
									"rotationZ": 88.8,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "antenne",
							"x": -5.386035000000001,
							"y": -10.473545,
							"z": 5.54153,
							"scaleX": 1.0000000000000007,
							"scaleY": 1.0000000000000007,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes-flare",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -0.41054,
									"scaleX": 1.5,
									"scaleZ": 0.43,
									"rotationZ": -69.6,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.34728581392308433,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.37669553614530665,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.3493865083675288,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.3535878972564177,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.36199067503419546,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.33258095281197314,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.2,
										"power": 0.8
									}
								},
								{
									"type": "subFX",
									"name": "LightBlue02_Flat",
									"source": "Fx/Structure/Lights/LightBlue02_Flat.fx",
									"y": -0.00983,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 4.5,
									"rotationX": -90,
									"rotationZ": 63.8,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "antenne",
							"x": -1.333645,
							"y": 5.2147950000000005,
							"z": 1.2434199999999986,
							"scaleX": 1.0000000000000007,
							"scaleY": 1.0000000000000007,
							"rotationZ": -89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "CrossPlanes-flare",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"z": -0.41054,
									"scaleX": 1.5,
									"scaleZ": 0.43,
									"rotationZ": -45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
													"parallax": 0,
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.125,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare07_glow.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.12013549804687576,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2162438964843758,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3043432617187508,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4004516601562508,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4649999999999999,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.08,
															"value": 1.323505719144871,
															"mode": 2
														},
														{
															"time": 0.22500000000000003,
															"value": 0.34728581392308433,
															"mode": 2
														},
														{
															"time": 0.42,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.5599999999999999,
															"value": 0.37669553614530665,
															"mode": 2
														},
														{
															"time": 0.6849999999999999,
															"value": 1.3172036358115378,
															"mode": 2
														},
														{
															"time": 0.84,
															"value": 0.3493865083675288,
															"mode": 2
														},
														{
															"time": 0.9199999999999999,
															"value": 1.3550161358115378,
															"mode": 2
														},
														{
															"time": 1.125,
															"value": 0.3535878972564177,
															"mode": 2
														},
														{
															"time": 1.3,
															"value": 1.3298078024782043,
															"mode": 2
														},
														{
															"time": 1.53,
															"value": 0.36199067503419546,
															"mode": 2
														},
														{
															"time": 1.7,
															"value": 1.3151029413670932,
															"mode": 2
														},
														{
															"time": 1.865,
															"value": 0.33258095281197314,
															"mode": 2
														},
														{
															"time": 2,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 0.2,
										"power": 0.8
									}
								},
								{
									"type": "subFX",
									"name": "LightBlue02_Flat",
									"source": "Fx/Structure/Lights/LightBlue02_Flat.fx",
									"y": -0.00983,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 4.5,
									"rotationX": -89.99999999999999,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Towers",
							"enabled": false,
							"x": -0.0016249999999996389,
							"y": -10.506454999999999,
							"z": 1.2893600000000003,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"x": -5.366125,
									"y": 0.00477499999999953,
									"z": 0.0010799999999999699,
									"scaleX": 0.2,
									"scaleY": 5.999999999999999,
									"scaleZ": 8.67,
									"rotationX": -89,
									"rotationY": -1.5902773407317584e-15,
									"rotationZ": -24.699999999999996,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 3
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png"
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.1,
												"maxAlpha": 1,
												"frequency": 0.25
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"x": 5.366124999999999,
									"y": -0.004775000000001306,
									"z": -0.0010799999999999699,
									"scaleX": 0.2,
									"scaleY": 5.999999999999998,
									"scaleZ": 8.669999999999998,
									"rotationX": -89.99999999999999,
									"rotationZ": 24.699999999999996,
									"kind": 0,
									"args": [
										0
									],
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 3
												}
											}
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png"
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.1,
												"maxAlpha": 1,
												"frequency": 0.25
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9411764705882353,
													1
												]
											}
										}
									]
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "subFX",
			"name": "LightBlue01",
			"source": "Fx/Structure/Lights/LightBlue01.fx",
			"enabled": false,
			"y": 11.31184,
			"z": 6.3685
		}
	]
}