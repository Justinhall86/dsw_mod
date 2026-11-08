{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"z": 0.5,
			"children": [
				{
					"type": "object",
					"name": "Spirale",
					"enabled": false,
					"z": -0.5,
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
							"z": -1.55721,
							"scaleX": 0.2,
							"scaleY": 0.2,
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
														"alpha": 0.75,
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
															0.14509803921568626,
															0.09411764705882353,
															0.17254901960784313
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
							"z": -0.36749,
							"scaleX": 45,
							"scaleY": 45,
							"scaleZ": 2,
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
										"alpha": 0.75
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
											0.07058823529411765,
											0.00392156862745098,
											0.050980392156862744
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "Swirl",
							"source": "Fx/Event/Swirl.fbx",
							"z": -0.4,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 9,
							"rotationZ": 42.6,
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
										"alpha": 0.55,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl01v_A.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
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
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.3
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
										"saturation": 0.5,
										"width": 0.4,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
											-0.05
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
											"enabled": false,
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
										"range": 5,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 7,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.42,
									"topSpan": 0.24,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
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
										"saturation": 0,
										"width": 0.58,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
											-0.1
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
											"enabled": false,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.34,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.4
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "model",
							"name": "SwirlInside",
							"source": "Fx/Event/Swirl.fbx",
							"z": -0.4,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 7,
							"rotationZ": 70,
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
										"alpha": 0.8,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl01v_A.png",
										"onDecal": false
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.4
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
										"saturation": 0,
										"width": 0.58,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
											-0.1
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
											"enabled": false,
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
										"range": 5,
										"power": 2
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"props": {
										"tag": "WIP"
									},
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.42,
									"topSpan": 0.24,
									"dirIntensity": 0.1,
									"dirSpan": 0,
									"sandBlend": 0.7,
									"envBlend": 0.7
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
										"saturation": 0.5,
										"width": 0.4,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/noise/Water_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.3,
											-0.1
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
											"enabled": false,
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
										"uvScaleY": 1,
										"texture": "Fx/noise/Wave_01.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
											-0.4
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "AwakeBackup",
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"rotationZ": 90,
					"children": [
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"lifeTime": 1.5,
								"lifeTimeRand": 0.5,
								"emitRate": 1,
								"maxCount": 15,
								"emitShape": "Cylinder",
								"emitRad2": 0.79,
								"emitSurface": true,
								"instOrbitSpeed": [
									0,
									0.2,
									2
								],
								"instOrbitSpeed_rand": [
									0,
									0.05,
									0.5
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
								"instScale": 5,
								"instScale_rand": 2,
								"alignMode": "Screen",
								"emitType": "Burst",
								"burstParticleCount": 6,
								"emitAngle": 360,
								"useRandomColor": true,
								"randomColor1": [
									0.7058823529411764,
									0.7058823529411764,
									0.7058823529411764,
									1
								],
								"instWorldSpeed": [
									0,
									0,
									10
								],
								"instWorldSpeed_rand": [
									0,
									0,
									4
								],
								"warmUpTime": -0.4
							},
							"z": 0.5725000000000002,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 1.25,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 0.2,
									"scaleY": 0.2,
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
													"culling": "Back",
													"colorMask": 255
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.25
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
												]
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
													1,
													0.7333333333333333,
													0.396078431372549
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.20392156862745098,
													0.011764705882352941,
													0.14901960784313725
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ParticleColorRandom",
											"source": "hrt.shader.ParticleColorRandom",
											"enabled": false,
											"props": {
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -532176393
															},
															{
																"position": 1,
																"color": -17563
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instWorldSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.6337566306121156
											},
											"nextHandle": {
												"dv": -8.1737481543644e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Spirale",
							"z": -0.03624999999999989,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "object",
									"name": "Bol",
									"z": -1.55721,
									"scaleX": 0.2,
									"scaleY": 0.2,
									"scaleZ": 0.2,
									"children": [
										{
											"type": "emitter",
											"name": "BolSharpInfinty",
											"props": {
												"instScale": 8.5,
												"lifeTime": 2,
												"instRotation": [
													0,
													180,
													0
												],
												"emitRate": 2,
												"emitType": "Burst",
												"warmUpTime": -0.4
											},
											"z": 1,
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
																"alpha": 3,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": -0.03,
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
																"range": 1.5,
																"power": 0.8
															},
															"isInstance": true
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"enabled": false,
															"props": {
																"amount": 1,
																"color": [
																	0.16862745098039217,
																	0.2980392156862745,
																	0.8705882352941177
																]
															}
														},
														{
															"type": "shader",
															"name": "EnvColorMult",
															"source": "shaders/EnvColorMult.hx",
															"props": {
																"sandBlend": 0.5,
																"sandColorSet": false,
																"envBlend": 1,
																"envColorSet": false
															},
															"isInstance": true
														}
													]
												},
												{
													"type": "curve",
													"name": "instRotation.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 18,
															"mode": 2
														},
														{
															"time": 1,
															"value": 150,
															"mode": 0,
															"prevHandle": {
																"dv": -12,
																"dt": -0.5854014598540146
															},
															"nextHandle": {
																"dv": 6.832832721310788,
																"dt": 0.33332918749948154
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
									"enabled": false,
									"z": -0.36749,
									"scaleX": 45,
									"scaleY": 45,
									"scaleZ": 2,
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
												"alpha": 0.75
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.4,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.014159784266047915,
																"dt": -0.2461037962976163
															},
															"nextHandle": {
																"dv": -0.03276054305348097,
																"dt": 0.3280474252074307
															}
														},
														{
															"time": 2,
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
													0.00392156862745098,
													0.01568627450980392,
													0.07058823529411765
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Swirl",
									"source": "Fx/Event/Swirl.fbx",
									"enabled": false,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 8.05,
									"rotationZ": 42.6,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01v_A.png",
												"onDecal": false
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
													-0.05
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.014159784266047915,
																"dt": -0.2461037962976163
															},
															"nextHandle": {
																"dv": -0.03276054305348097,
																"dt": 0.3280474252074307
															}
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
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
												"range": 2,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 7,
													"value": 1,
													"mode": 2
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
												"saturation": 0,
												"width": 0.58,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
													-0.1
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
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
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.8392156862745098,
													0.7254901960784313,
													0.5725490196078431
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
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
													0.2784313725490196,
													0.6313725490196078,
													0.9686274509803922
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "Swirl",
									"source": "Fx/Event/Swirl.fbx",
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 6.44,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl01v_A.png",
												"onDecal": false
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
												"progress": 0.5,
												"saturation": 0,
												"width": 0.4,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
													-0.05
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.33063632259314835,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7306363225931483,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.014159784266047915,
																"dt": -0.2461037962976163
															},
															"nextHandle": {
																"dv": -0.03276054305348097,
																"dt": 0.3280474252074307
															}
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.3306363225931483,
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
												"range": 2,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 7,
													"value": 1,
													"mode": 2
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
												"saturation": 0,
												"width": 0.58,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/Water_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.3,
													-0.1
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5397187795356877,
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
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3306363225931483,
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
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.8392156862745098,
													0.7254901960784313,
													0.5725490196078431
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.2784313725490196,
													0.6313725490196078,
													0.9686274509803922
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt",
							"enabled": false,
							"z": 0.8,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 6,
									"rotationX": 90,
									"rotationY": 180,
									"rotationZ": 90,
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
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Alphas/SupplyDrop_test03albedo.png"
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
												"vOffset": 0,
												"texture": "Fx/Alphas/SupplyDrop_test03.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 8.001025754429375e-16,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.2372448979591837
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 9.247254013931531,
															"value": 1,
															"mode": 0
														},
														{
															"time": 10.368236922659706,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -1.3826976449715218
															},
															"nextHandle": {
																"dv": -0.012406274026611945,
																"dt": 1.0227749914107727
															}
														}
													]
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/Alphas/SupplyDrop_test03normal.png",
											"topBrighten": true,
											"topIntensity": 0.9,
											"topSpan": 0.33,
											"dirSpan": 0,
											"sandBlend": 0.05,
											"envBlend": 0.7
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.22,
												"color": [
													0.5215686274509804,
													0.3529411764705882,
													0.2549019607843137
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
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad_inv.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 9.501326125773224,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 9.995529831140065,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.03333333333333344,
																"dt": -0.37886240829004514
															},
															"nextHandle": {
																"dv": -0.014527503975154689,
																"dt": 0.16468311302145025
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0.0049999999999999975,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5,
													"value": 0.005,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3312135090049048
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33378649099509516
													}
												},
												{
													"time": 1.5,
													"value": -0.005,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.33152070268628603
													}
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "position.z",
									"enabled": false,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0.9333333333333333,
											"mode": 2
										},
										{
											"time": 10,
											"value": -145,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "position.y",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3312135090049048
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33378649099509516
											}
										},
										{
											"time": 3,
											"value": -1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33152070268628603
											}
										},
										{
											"time": 4.75,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "position.x",
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3312135090049048
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33378649099509516
											}
										},
										{
											"time": 3,
											"value": -1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33152070268628603
											}
										},
										{
											"time": 4.75,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Floor",
							"enabled": false,
							"props": {
								"instScale_rand": 1,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 32,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"instScale": 18,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 3,
								"emitShape": "Cylinder",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"lifeTime": 1.5,
								"burstDelay": 0.5,
								"instOffset": [
									0,
									0,
									1
								]
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.010000000000000002,
							"rotationZ": 43.60000000000001,
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
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6472728746925278,
																"dt": -0.012445056058803479
															},
															"nextHandle": {
																"dv": 0.9454545454545454,
																"dt": 0.007142857142857143
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 8.922912650454184e-17,
																"dt": -0.21499999999999997
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.36
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01694444444444443,
																"dt": -0.27
															},
															"nextHandle": {
																"dv": 0.013434004892663146,
																"dt": 0.21406315992899264
															}
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
													0.9098039215686274,
													0.9098039215686274,
													0.9098039215686274
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
												"progress": 1,
												"saturation": 0,
												"width": 0.42,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/NoisyWave_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1116321015082125,
																"dt": -0.3076091494743911
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.2774350174349862
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
												"range": 25,
												"power": 50
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"topSpan": 0.5,
											"dirIntensity": 0.5,
											"dirSpan": 0.9,
											"sandBlend": 0.6,
											"envBlend": 0.5
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.05166666666666666
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.07620241819144336,
												"dt": -0.9450000000000001
											},
											"nextHandle": {
												"dv": 0.021440078189261927,
												"dt": 0.265882295729136
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.6195399014805467,
												"dt": 2.975046534659357e-17
											},
											"nextHandle": {
												"dv": -1.1333333333333333,
												"dt": 0
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.016666666666666663,
												"dt": -0.98
											},
											"nextHandle": {
												"dv": -0.005668855987316409,
												"dt": 0.3333287320541929
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sand_Floor2",
							"props": {
								"instScale_rand": 2,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									180
								],
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instScale": 20,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 5,
								"emitShape": "Cylinder",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"alignMode": "Screen",
								"warmUpTime": -0.2,
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"seedGroup": 2,
								"lifeTime": 2,
								"burstDelay": 0.5,
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instOffset": [
									0,
									0,
									2
								],
								"instSpeed": [
									10,
									0,
									0
								],
								"emitAngle": 360
							},
							"z": -0.1,
							"scaleX": 0.9999999999999997,
							"scaleY": 0.9999999999999997,
							"scaleZ": 0.01,
							"rotationZ": 2.0999999999999996,
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
													"culling": "Back",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.8
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.6472728746925278,
																"dt": -0.012445056058803479
															},
															"nextHandle": {
																"dv": 0.9454545454545454,
																"dt": 0.007142857142857143
															}
														},
														{
															"time": 0.45,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 8.922912650454184e-17,
																"dt": -0.21499999999999997
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.36
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01694444444444443,
																"dt": -0.27
															},
															"nextHandle": {
																"dv": 0.013434004892663146,
																"dt": 0.21406315992899264
															}
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
													1,
													1,
													1
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
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
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
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.85,
															"mode": 0,
															"prevHandle": {
																"dv": 1.1116321015082125,
																"dt": -0.3076091494743911
															},
															"nextHandle": {
																"dv": -1,
																"dt": 0.2774350174349862
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
												"range": 2,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"enabled": false,
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.4,
											"topSpan": 0.8,
											"dirIntensity": 0.23,
											"dirSpan": 0.9,
											"sandBlend": 0.7,
											"envBlend": 0.5
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 1,
												"envColorSet": false
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.05166666666666666
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.040734981627899014,
												"dt": -0.6732812499999992
											},
											"nextHandle": {
												"dv": 0.016048606913192237,
												"dt": 0.2659338296837626
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 1.0368041795619947,
												"dt": -0.22469329683007053
											},
											"nextHandle": {
												"dv": -1.0041624617719014,
												"dt": 0.2179870466083442
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024279651221022422,
												"dt": -0.3496719776184397
											},
											"nextHandle": {
												"dv": 0.024279651221022422,
												"dt": 0.3496719776184397
											}
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "SupplyBox",
							"source": "Fx/Meshes_Common/SupplyBox.fbx",
							"z": -0.62,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "PBR",
											"blend": "None",
											"shadows": true,
											"culling": "Back",
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"diffuseMap": "Fx/Meshes_Common/SupplyBox_Albedo.png"
								},
								{
									"type": "curve",
									"name": "position.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": -1.5,
											"mode": 2
										},
										{
											"time": 1.0164172596244798,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.026663164377695815,
												"dt": -0.5356657201965959
											},
											"nextHandle": {
												"dv": -0.03333333333333333,
												"dt": 0.6719059550972022
											}
										},
										{
											"time": 3,
											"value": 0,
											"mode": 2
										},
										{
											"time": 5,
											"value": -1.5,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.5,
										"color": [
											0.14509803921568626,
											0.12156862745098039,
											0.10980392156862745
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": 0.144055,
							"z": -0.6253500000000001,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.14405,
									"z": 0.01201,
									"scaleX": 6,
									"scaleY": 3,
									"scaleZ": 2.25,
									"rotationX": 89.99999999999999,
									"albedoMap": "Fx/Alphas/Destruction_Decal_Alpha.png",
									"albedoStrength": 3,
									"fadePower": 3,
									"children": [
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 2.98,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02356852808625938,
																"dt": -0.4998915283640561
															},
															"nextHandle": {
																"dv": 0.01611111111111113,
																"dt": 0.33834989965171247
															}
														},
														{
															"time": 3.3041116184017123,
															"value": 1,
															"mode": 2
														},
														{
															"time": 15.938660956757161,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01861245247967639,
																"dt": -4.211416294722059
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 3.7753286941931172
															}
														},
														{
															"time": 19.965339028337997,
															"value": 0,
															"mode": 0
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.8,
												"sandColorSet": true,
												"envBlend": 1,
												"envColorSet": false
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.144055,
									"z": 0.07508000000000006,
									"scaleX": 6,
									"scaleY": 4,
									"scaleZ": 2.25,
									"albedoMap": "Fx/Alphas/Destruction_Decal_Alpha.png",
									"albedoStrength": 3,
									"children": [
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.6
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 2.98,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.02356852808625938,
																"dt": -0.4998915283640561
															},
															"nextHandle": {
																"dv": 0.01611111111111113,
																"dt": 0.33834989965171247
															}
														},
														{
															"time": 3.3041116184017123,
															"value": 1,
															"mode": 2
														},
														{
															"time": 15.938660956757161,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01861245247967639,
																"dt": -4.211416294722059
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 3.7753286941931172
															}
														},
														{
															"time": 19.965339028337997,
															"value": 0,
															"mode": 0
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
													1,
													1,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.8,
												"sandColorSet": true,
												"envBlend": 1,
												"envColorSet": false
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.051750275843761795,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.051750275843761795,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.051750275843761795,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.02356852808625938,
														"dt": -0.4998915283640561
													},
													"nextHandle": {
														"dv": 0.01611111111111113,
														"dt": 0.33834989965171247
													}
												},
												{
													"time": 0.3758618942454741,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3758618942454741,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.3758618942454741,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.0250513679299997,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.0250513679299997,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.0250513679299997,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5,
													"value": 0,
													"mode": 0
												},
												{
													"time": 5,
													"value": 0,
													"mode": 0
												},
												{
													"time": 5,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.8680531055331467
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8680531055331467
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_FlareLarge",
							"enabled": false,
							"z": 2.82342,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 1.5,
							"rotationZ": -105.8,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 6,
									"scaleY": 40,
									"scaleZ": 2.05,
									"rotationX": -90,
									"rotationZ": -90,
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
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.295792704483248,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.48579270448324796,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
															}
														},
														{
															"time": 1.487621051835921,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
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
												"texture": "Fx/Alphas/T_circle2.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 15,
												"power": 2
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "shaders/GradientMap.hx",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -151464545
															},
															{
																"position": 1,
																"color": -1
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.6431372549019607,
													0.5019607843137255,
													0.28627450980392155
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3153236153651962,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00757687696833834,
																"dt": -0.06406311509621984
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.28150569319861213
															}
														},
														{
															"time": 1.0041889953613283,
															"value": 1,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
											}
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_FlareWhite",
							"enabled": false,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 1.5,
							"rotationZ": -101.4,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								1
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 20,
									"scaleZ": 1.5,
									"rotationX": -90,
									"rotationZ": -90,
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
													"emissive": 0.5
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl05v_A.png",
												"onDecal": false
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
												"progress": 0.29,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Water_04.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.2,
													1
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
												"texture": "Fx/Alphas/T_circle5.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl04v_A.jpg"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.295792704483248,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.48579270448324796,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
															}
														},
														{
															"time": 1.6054903079199592,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7607843137254902,
													0.596078431372549,
													0.34509803921568627
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.36573794943547494,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00757687696833834,
																"dt": -0.06406311509621984
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.28150569319861213
															}
														},
														{
															"time": 1.4716184183371814,
															"value": 1,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.8,
												"envColorSet": false
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"keyMode": 0,
									"keys": [
										{
											"time": -0.061405901311585076,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.008238709171402767,
												"dt": -0.18537095635656012
											},
											"nextHandle": {
												"dv": -0.029999999999999916,
												"dt": 0.675625
											}
										},
										{
											"time": 0.546719098688415,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.2552601832114378,
											"value": 1.8000000000000012,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.22752087249572386
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.22752087249572386
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
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
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
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		}
	]
}