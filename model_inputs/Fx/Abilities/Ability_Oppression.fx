{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.8,
			"scaleY": 0.8,
			"scaleZ": 0.8,
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"z": 0.02,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "Spirale",
					"z": 0.5,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "object",
							"name": "Village",
							"editorOnly": true,
							"x": -0.038696666666666664,
							"y": -0.3230993333333333,
							"z": 0.21681800000000007,
							"children": [
								{
									"type": "object",
									"name": "States",
									"x": -0.024,
									"y": 0.193174,
									"z": -0.8080719999999999,
									"children": [
										{
											"type": "object",
											"name": "Revolt_01",
											"enabled": false,
											"children": [
												{
													"type": "reference",
													"name": "FX_Fire_01",
													"source": "Fx/Smoke/FX_Fire_01.fx",
													"x": 0.36,
													"y": -2.44,
													"z": 1.6,
													"scaleX": 0.55,
													"scaleY": 0.55,
													"scaleZ": 0.55
												},
												{
													"type": "reference",
													"name": "FX_Fire_01",
													"source": "Fx/Smoke/FX_Fire_01.fx",
													"x": -2.37,
													"y": 1.82,
													"z": 1.2,
													"scaleX": 0.55,
													"scaleY": 0.55,
													"scaleZ": 0.55
												},
												{
													"type": "reference",
													"name": "FX_Fire_01",
													"source": "Fx/Smoke/FX_Fire_01.fx",
													"x": 0.98,
													"y": 1.23,
													"z": 0.05,
													"scaleX": 0.55,
													"scaleY": 0.55,
													"scaleZ": 0.55
												}
											]
										},
										{
											"type": "object",
											"name": "Revolt_02",
											"enabled": false,
											"children": [
												{
													"type": "reference",
													"name": "FX_Fire_01",
													"source": "Fx/Smoke/FX_Fire_01.fx",
													"x": 0.45,
													"y": -2.69,
													"z": 1.32
												},
												{
													"type": "reference",
													"name": "FX_Fire_01",
													"source": "Fx/Smoke/FX_Fire_01.fx",
													"x": -2.37,
													"y": 1.82,
													"z": 1.2
												},
												{
													"type": "reference",
													"name": "FX_Fire_01",
													"source": "Fx/Smoke/FX_Fire_01.fx",
													"x": 0.98,
													"y": 1.23,
													"z": 0.05
												},
												{
													"type": "reference",
													"name": "FX_Fire_01",
													"source": "Fx/Smoke/FX_Fire_01.fx",
													"x": 0.65,
													"y": -0.43,
													"z": 0.3
												}
											]
										},
										{
											"type": "object",
											"name": "Pillaged_01",
											"enabled": false,
											"children": [
												{
													"type": "reference",
													"name": "FX_Pillaged_Mist",
													"source": "Fx/Structure/Common/FX_Pillaged_Mist.fx",
													"x": -0.1,
													"y": 0.02,
													"z": -1.06,
													"scaleX": 6.99,
													"scaleY": 9.76,
													"scaleZ": 6.99,
													"rotationZ": -70.5
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_Grey_1",
													"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
													"x": 0.17,
													"y": -1.75,
													"z": 0.27,
													"scaleX": 1.5,
													"scaleY": 1.5,
													"scaleZ": 1.5
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_Grey_1",
													"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
													"x": -1.184,
													"y": 1.8379999999999999,
													"z": 0.266,
													"scaleX": 1.5,
													"scaleY": 1.5,
													"scaleZ": 1.5
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_Grey_2",
													"source": "Fx/Smoke/FX_Smoke_Big_Grey_2.fx",
													"x": 0.996,
													"y": -0.14200000000000002,
													"z": 0.266,
													"scaleX": 1.5,
													"scaleY": 1.5,
													"scaleZ": 1.5
												},
												{
													"type": "advancedDecal",
													"name": "advancedDecal",
													"x": 0.16,
													"y": 0.09,
													"scaleX": 10.33,
													"scaleY": 10.33,
													"scaleZ": 8.05,
													"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
													"albedoStrength": 1.5
												}
											]
										},
										{
											"type": "object",
											"name": "Pillaged_02",
											"enabled": false,
											"children": [
												{
													"type": "reference",
													"name": "FX_Pillaged_Mist",
													"source": "Fx/Structure/Common/FX_Pillaged_Mist.fx",
													"x": -0.09,
													"y": 0.36,
													"z": -1.15,
													"scaleX": 7.48,
													"scaleY": 10.44,
													"scaleZ": 7.48,
													"rotationZ": -70.5
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_Grey_1",
													"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
													"x": -0.043999999999999984,
													"y": -2.002,
													"z": 0.266,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_Grey_1",
													"source": "Fx/Smoke/FX_Smoke_Big_Grey_1.fx",
													"x": -1.184,
													"y": 1.8379999999999999,
													"z": 0.266,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_Grey_2",
													"source": "Fx/Smoke/FX_Smoke_Big_Grey_2.fx",
													"x": 0.996,
													"y": -0.14200000000000002,
													"z": 0.266,
													"scaleX": 0.6,
													"scaleY": 0.6,
													"scaleZ": 0.6
												},
												{
													"type": "advancedDecal",
													"name": "advancedDecal",
													"x": 0.08,
													"y": 0.04,
													"z": 0.27,
													"scaleX": 10.54,
													"scaleY": 10.54,
													"scaleZ": 8.22,
													"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png"
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "group",
									"x": 0.096,
									"y": 0.393174,
									"z": -0.8080719999999999,
									"rotationZ": 6.599999999999998,
									"children": [
										{
											"type": "object",
											"name": "FX",
											"enabled": false,
											"x": -0.5266321196624828,
											"y": -0.5493611499185218,
											"z": 1.20125,
											"rotationZ": -6.599999999999999,
											"children": [
												{
													"type": "reference",
													"name": "Prefab_Antena_02",
													"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_02.prefab",
													"x": -0.78,
													"y": 3.00625,
													"z": -0.8212499999999999
												},
												{
													"type": "reference",
													"name": "Prefab_Antena_03",
													"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_03.prefab",
													"x": -1.89,
													"y": 2.03625,
													"z": 0.11875000000000013
												},
												{
													"type": "reference",
													"name": "Prefab_Antena_01",
													"source": "Structure/Village/Tiles/Model/Props/Prefab_Antena_01.prefab",
													"x": 2.26,
													"y": -1.18,
													"z": -0.82,
													"scaleX": 0.84,
													"scaleY": 0.84,
													"scaleZ": 0.84
												},
												{
													"type": "reference",
													"name": "LightYellow03_Sphere",
													"source": "Fx/Structure/Lights/LightYellow03_Sphere.fx",
													"x": 0.79,
													"y": -2.47375,
													"z": 1.13875,
													"scaleX": 0.25,
													"scaleY": 0.25,
													"scaleZ": 0.25
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_5",
													"source": "Fx/Smoke/FX_Smoke_Big_5.fx",
													"x": 2.37,
													"y": 0.87,
													"z": 0.59,
													"scaleX": 0.3,
													"scaleY": 0.3,
													"scaleZ": 0.3,
													"rotationZ": -145.7
												},
												{
													"type": "reference",
													"name": "FX_Smoke_Big_5",
													"source": "Fx/Smoke/FX_Smoke_Big_5.fx",
													"x": -1.2,
													"y": -1.84,
													"z": -0.58,
													"scaleX": 0.3,
													"scaleY": 0.3,
													"scaleZ": 0.3,
													"rotationZ": -145.7
												}
											]
										},
										{
											"type": "model",
											"name": "Village_Large_01",
											"source": "Structure/Village/Tiles/Model/Village_Large_01.fbx",
											"x": -0.1421921619706209,
											"y": -0.1848820950609353,
											"scaleX": 1.25,
											"scaleY": 1.25,
											"scaleZ": 1.25,
											"rotationZ": 102.20000000000003,
											"children": [
												{
													"type": "shader",
													"name": "WindCloth",
													"source": "shaders/WindCloth.hx",
													"enabled": false,
													"props": {
														"speed": 2,
														"amount": 3.64,
														"zamount": 1,
														"freq": 9.09
													},
													"targetMaterial": "VillageMisc_01_Wind_Neutral_MAT",
													"recursiveApply": false,
													"isInstance": true
												}
											]
										},
										{
											"type": "object",
											"name": "Decals",
											"x": -0.6033333333333332,
											"y": 1.2766666666666666,
											"children": [
												{
													"type": "tdecal",
													"name": "tdecal",
													"x": 0.33,
													"y": -1.08,
													"scaleX": 12.93,
													"scaleY": 12.93,
													"scaleZ": 0.44,
													"rotationZ": 93.5,
													"albedoMap": "Structure/Resources/Decals/DirtDecal_1_color.png",
													"normalMap": "Structure/Resources/Decals/DirtDecal_1_normal.png"
												}
											]
										},
										{
											"type": "object",
											"name": "Sockets",
											"enabled": false,
											"x": 2.4499999999999997,
											"y": 2.130000000000001,
											"children": [
												{
													"type": "model",
													"name": "Socket",
													"source": "Structure/Village/Tiles/Model/Socket.fbx",
													"x": 92.57,
													"y": -1061.82,
													"scaleY": 1.0000000000000002,
													"scaleZ": 1.0000000000000002,
													"rotationZ": 100
												},
												{
													"type": "model",
													"name": "Socket",
													"source": "Structure/Village/Tiles/Model/Socket.fbx",
													"x": 1.5200000000000005,
													"y": -4.900000000000001,
													"scaleY": 1.0000000000000002,
													"scaleZ": 1.0000000000000002,
													"rotationZ": 100
												},
												{
													"type": "model",
													"name": "Socket",
													"source": "Structure/Village/Tiles/Model/Socket.fbx",
													"x": 1.7000000000000002,
													"y": -1.6700000000000017,
													"scaleY": 1.0000000000000002,
													"scaleZ": 1.0000000000000002,
													"rotationZ": 100
												},
												{
													"type": "model",
													"name": "Socket",
													"source": "Structure/Village/Tiles/Model/Socket.fbx",
													"x": -0.9299999999999999,
													"y": 2.669999999999998,
													"scaleY": 1.0000000000000002,
													"scaleZ": 1.0000000000000002,
													"rotationZ": 100
												},
												{
													"type": "model",
													"name": "Socket",
													"source": "Structure/Village/Tiles/Model/Socket.fbx",
													"x": 1.5300000000000011,
													"y": 1.2099999999999986,
													"scaleY": 1.0000000000000002,
													"scaleZ": 1.0000000000000002,
													"rotationZ": 100
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"editorOnly": true,
									"locked": true,
									"x": -0.024,
									"y": 0.35499400000000003,
									"z": -0.7779219999999999,
									"scaleX": 4000,
									"scaleY": 4000,
									"scaleZ": 2,
									"color": -14869219,
									"kind": 0,
									"args": [
										0
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Bol",
							"z": -1.75,
							"scaleX": 0.18,
							"scaleY": 0.18,
							"scaleZ": 0.2,
							"children": [
								{
									"type": "emitter",
									"name": "BolSharpInfinty",
									"props": {
										"instScale": 7,
										"lifeTime": 2,
										"instRotation": [
											0,
											180,
											0
										],
										"emitRate": 2
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 41.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 7,
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
															"enableStencil": false,
															"parallax": 0
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": -0.02,
														"texture": "Fx/Gradients/GradientSpice_2.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": -0.0031778692272519393,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5056226185032769,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 1,
														"width": 0.37,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.2,
															0.1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 3,
														"uvScaleY": 4,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.25,
															0.05
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.2090824569425393,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.11604552724598342,
																		"dt": -0.49988189441195807
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.2871757354061881
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 10,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 5
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6196078431372549,
															0.11372549019607843,
															0.09019607843137255
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "BolSharpInfinty",
									"props": {
										"instScale": 7,
										"lifeTime": 2,
										"instRotation": [
											0,
											180,
											0
										],
										"emitRate": 2
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Hemisphere",
											"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 7,
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
															"enableStencil": false,
															"parallax": 0,
															"emissive": 2
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
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": -0.02,
														"texture": "Fx/Gradients/GradientSpice_2.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": -0.0031778692272519393,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5056226185032769,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 1,
														"width": 0.37,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.2,
															0.1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.34,
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 3,
														"uvScaleY": 4,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.25,
															0.05
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.2090824569425393,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.11604552724598342,
																		"dt": -0.49988189441195807
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.2871757354061881
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 10,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 5
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6196078431372549,
															0.11372549019607843,
															0.09019607843137255
														]
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal",
							"z": -0.36748999999999993,
							"scaleX": 50,
							"scaleY": 50,
							"scaleZ": 3,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 1.8,
							"fadeStart": 0.08,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
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
											0.2588235294117647,
											0.023529411764705882,
											0.023529411764705882
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "BloodSparks",
							"props": {
								"lifeTime": 4,
								"lifeTimeRand": 3,
								"maxCount": 25,
								"alignMode": "Screen",
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.12156862745098039,
									0.12156862745098039,
									0.12156862745098039,
									1
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"instAcceleration": [
									0,
									0.25,
									0.45
								],
								"instAcceleration_rand": [
									0,
									0.1,
									0.3
								],
								"instScale": 0.85,
								"instScale_rand": 0.25,
								"emitRate": 3,
								"instRotation_rand": [
									0,
									0,
									180
								]
							},
							"x": 0.23005,
							"y": -0.33725,
							"z": 0.0624,
							"scaleX": 6,
							"scaleY": 6,
							"scaleZ": 2,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
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
													"enableStencil": false,
													"parallax": 0,
													"emissive": 8
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 2
													},
													"children": [
														{
															"type": "curve",
															"name": "scale",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.017451767792620955,
																		"dt": -0.4999931472585605
																	},
																	"nextHandle": {
																		"dv": -0.033333333333333326,
																		"dt": 0.9549999999999998
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.1666666666666667,
																		"dt": -0.2350000000000001
																	},
																	"nextHandle": {
																		"dv": -1.3272581022181487,
																		"dt": 0.26734770344679853
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 0.5,
														"uvScaleX": 0.15,
														"uvScaleY": 0.15,
														"texture": "Fx/noise/Water_03.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.05,
															0
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
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
															0.6666666666666666,
															0.00392156862745098,
															0.00392156862745098
														]
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "RedBackground",
							"z": -5.97452,
							"scaleX": 3,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"children": [
								{
									"type": "model",
									"name": "background",
									"source": "Fx/Meshes_Common/Plane_50polys.fbx",
									"z": 4.82267,
									"scaleX": 40,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationY": 95,
									"rotationZ": 45,
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
													"enableStencil": false,
													"parallax": 0
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_02.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.4,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															-0.02,
															0.0125
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6196078431372549,
															0.11372549019607843,
															0.09019607843137255
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 4,
														"power": 0.8
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.7,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						}
					]
				}
			]
		}
	]
}