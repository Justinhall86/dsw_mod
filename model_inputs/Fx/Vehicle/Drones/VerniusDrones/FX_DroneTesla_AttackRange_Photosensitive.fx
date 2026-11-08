{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "DroneTesla",
					"source": "Vehicle/Vernius/DroneTesla/DroneTesla.fbx",
					"editorOnly": true,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"rotationZ": 90,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/DroneTesla/Anim_DroneTesla_AttackRange.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Anticipation",
					"rotationX": -90,
					"children": [
						{
							"type": "object",
							"name": "Mesh",
							"x": 3.469446951953614e-18,
							"y": -0.003159999999999996,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"rotationX": 9.939233379573491e-17,
							"rotationY": 9.939233379573491e-17,
							"rotationZ": 2.329507823337537e-18,
							"children": [
								{
									"type": "model",
									"name": "VerniusTesla_Lights",
									"source": "Fx/Meshes_Common/VerniusTesla_Lights.fbx",
									"enabled": false,
									"y": -0.006319999999999999,
									"scaleX": 0.9999999999999998,
									"scaleZ": 1.0000000000000002,
									"rotationX": 1.987846675914698e-16,
									"rotationY": 9.939233379573491e-17,
									"rotationZ": 2.329507823337537e-18,
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
													"emissive": 15,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"texture": "Fx/Gradients/T_Square03.jpg"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43529411764705883,
													0.3058823529411765,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.8518688978693754,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8223793328056753,
																"dt": -0.12311554122299306
															},
															"nextHandle": {
																"dv": -0.7333333333333334,
																"dt": 0.011669411659240847
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
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0,
												"maxAlpha": 1,
												"frequency": 3
											}
										}
									]
								},
								{
									"type": "model",
									"name": "VerniusTesla_Torus",
									"source": "Fx/Meshes_Common/VerniusTesla_Torus.fbx",
									"x": 3.469446951953614e-18,
									"y": 0.0031599999999999996,
									"z": -4.440892098500626e-16,
									"scaleX": 0.9899999999999998,
									"scaleY": 0.9899999999999998,
									"scaleZ": 0.88,
									"rotationX": 2.0079259352673723e-16,
									"rotationY": 1.0039629676336862e-16,
									"rotationZ": 5.255118658707576e-17,
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
													"emissive": 2,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.43529411764705883,
													0.3058823529411765,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 0.50390625,
																"color": -1
															},
															{
																"position": 1,
																"color": -16777216
															}
														],
														"resolution": 64,
														"isVertical": true,
														"interpolation": "Linear",
														"colorMode": 0
													}
												},
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
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.25
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.018484762479112283,
																"dt": -0.5004569453156072
															},
															"nextHandle": {
																"dv": 0.014106647806061745,
																"dt": 0.2594416637058518
															}
														},
														{
															"time": 0.8518688978693754,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8223793328056753,
																"dt": -0.12311554122299306
															},
															"nextHandle": {
																"dv": -0.7333333333333334,
																"dt": 0.011669411659240847
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
										}
									]
								},
								{
									"type": "model",
									"name": "VerniusTesla_Torus",
									"source": "Fx/Meshes_Common/VerniusTesla_Torus.fbx",
									"x": 3.469446951953614e-18,
									"y": 0.0031599999999999996,
									"z": -4.440892098500626e-16,
									"scaleX": 0.9899999999999999,
									"scaleY": 0.99,
									"scaleZ": 0.88,
									"rotationX": 5.0198148381684296e-17,
									"rotationY": -2.0079259352673718e-16,
									"rotationZ": 118.57185352520082,
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
													"emissive": 2,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"uScale": 4,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Lines01.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.055155079717134785,
																"dt": -0.49976348153832684
															},
															"nextHandle": {
																"dv": 0.01652892561983471,
																"dt": 0.14976958525345618
															}
														},
														{
															"time": 0.20276497695852536,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6044715681405809,
															"value": 1,
															"prevHandle": {
																"dv": 0.013282081485311015,
																"dt": -0.19996571526502624
															},
															"nextHandle": {
																"dv": -0.016810393530475087,
																"dt": 0.19776740711405538
															}
														},
														{
															"time": 1.3044715681405774,
															"value": 0,
															"prevHandle": {
																"dv": 0.016810393530475032,
																"dt": -0.4317589825748849
															},
															"nextHandle": {
																"dv": -0.01532754639840462,
																"dt": 0.4999817381617572
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
													0.43529411764705883,
													0.3058823529411765,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -16777216
															},
															{
																"position": 0.50390625,
																"color": -1
															},
															{
																"position": 1,
																"color": -16777216
															}
														],
														"resolution": 64,
														"isVertical": true,
														"interpolation": "Linear",
														"colorMode": 0
													}
												},
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
											"type": "curve",
											"name": "rotation.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.030907259225909357,
														"dt": -0.4998697367096313
													},
													"nextHandle": {
														"dv": 0.04159978826582883,
														"dt": 0.6735638356421483
													}
												},
												{
													"time": 1.1044715681405772,
													"value": 0.5,
													"prevHandle": {
														"dv": 0.04034357205756911,
														"dt": -1.1456895405235306
													},
													"nextHandle": {
														"dv": -0.0060631073693817915,
														"dt": 0.16511233639905024
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
							"name": "Decals",
							"enabled": false,
							"x": -0.06466,
							"y": -0.21715,
							"z": 1,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Green",
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 3,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4627450980392157,
													0.2980392156862745,
													1
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.25
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.018484762479112283,
																"dt": -0.5004569453156072
															},
															"nextHandle": {
																"dv": 0.014106647806061745,
																"dt": 0.2594416637058518
															}
														},
														{
															"time": 0.8518688978693754,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.8223793328056753,
																"dt": -0.12311554122299306
															},
															"nextHandle": {
																"dv": -0.7333333333333334,
																"dt": 0.011669411659240847
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Green",
									"enabled": false,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 3,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Alphas/T_ChocWave_Contrast02.png",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.580392156862745,
													0.4549019607843137,
													0.9921568627450981
												]
											}
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.03485975677854325,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.10527968055035841,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.19917291224611194,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.3480308554906656,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.13934203771706083,
																"dt": -0.0940868914220308
															},
															"nextHandle": {
																"dv": -0.0005562475711130138,
																"dt": 0.47318471673981344
															}
														},
														{
															"time": 0.8755118776817458,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9104249280187479,
															"value": 0.02163275373246143,
															"mode": 2
														},
														{
															"time": 0.9372811205856726,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9802510286927522,
															"value": 0.02494925287235139,
															"mode": 2
														},
														{
															"time": 1.036649033083294,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1118463722706833,
															"value": 0.05479774513136104,
															"mode": 2
														},
														{
															"time": 1.1924149499714574,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2971541009824636,
															"value": 0.10786173136960042,
															"mode": 2
														},
														{
															"time": 1.396522013480085,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4905186874643217,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 1.600629076988713,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.685641958570401,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.697311370229642,
															"value": 0,
															"mode": 2
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
							"type": "emitter",
							"name": "emitterElec",
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 10,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_01.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.25,
								"animationBlendBetweenFrames": false,
								"emitRate": 6,
								"emitShape": "Cylinder",
								"emitAngle": 310,
								"emitSurface": true,
								"instScale": 0.95,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
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
							},
							"z": 0.16333,
							"scaleX": 6.4,
							"scaleY": 6.4,
							"scaleZ": 0.38,
							"rotationZ": 90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
												"speed": 10,
												"frameDivision": [
													2,
													2
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": false
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5686274509803921,
													0.47058823529411764,
													1
												]
											}
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
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.39631336405529954,
											"value": 2,
											"mode": 2
										},
										{
											"time": 1.4101382488479264,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter",
							"enabled": false,
							"props": {
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"emitRate": 10,
								"maxCount": 15,
								"emitShape": "Cylinder",
								"emitAngle": 300,
								"emitSurface": true,
								"emitOrientation": "Normal",
								"frameCount": 4,
								"frameDivisionY": 4,
								"animationBlendBetweenFrames": false,
								"instScale": 0.8,
								"instScale_rand": 0.25,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_14.png",
								"seedGroup": 2,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
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
							},
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 0.38,
							"rotationZ": 90,
							"children": [
								{
									"type": "model",
									"name": "CylinderCone_StraightUV",
									"source": "Fx/Meshes_Common/CylinderStraight_02.fbx",
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5686274509803921,
													0.47058823529411764,
													1
												]
											}
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
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.39631336405529954,
											"value": 2,
											"mode": 2
										},
										{
											"time": 1.4101382488479264,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Gun",
							"y": -5.5,
							"z": 0.32924,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "model",
											"name": "CrossPlanes",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"enabled": false,
											"z": -0.87559,
											"scaleZ": 0.8,
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
															"colorMask": 255
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "model",
											"name": "CrossPlanes",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"z": -0.1723,
											"scaleX": 0.2,
											"scaleY": 0.2,
											"scaleZ": 0.16,
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
															"emissive": 1
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5411764705882353,
															0.4392156862745098,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"enabled": false,
											"scaleX": 0.4,
											"scaleY": 0.4,
											"scaleZ": 0.4,
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
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.2,
														"power": 0.8
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitterWaves",
									"enabled": false,
									"props": {
										"lifeTime": 0.5,
										"alignLockAxis": "Z",
										"burstCount": 3,
										"instScale": 7,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0,
										"useRandomColor": true,
										"randomColor1": [
											1,
											0.7843137254901961,
											0.7843137254901961,
											1
										],
										"burstDelay": 0.2,
										"randomColor2": [
											0.8549019607843137,
											0.9490196078431372,
											0.996078431372549,
											1
										],
										"emitDuration": 1.3,
										"alignMode": "Screen",
										"emitRate": 4,
										"maxCount": 10,
										"warmUpTime": 0.1,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
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
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
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
															"colorMask": 255
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.25,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_LensFlare_07.png"
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 1.5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.8196078431372549,
															0.7764705882352941,
															0.996078431372549
														]
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0,
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
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.82,
												"saturation": 1,
												"width": 0.8,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Fire.png",
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
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -1.4695667122012668,
														"dt": -0.36113644276397655
													},
													"nextHandle": {
														"dv": 1.5173354123320077,
														"dt": 0.3744436448880628
													}
												},
												{
													"time": 0.9999592569159829,
													"value": 2,
													"mode": 1,
													"prevHandle": {
														"dv": -0.02201704545454497,
														"dt": -0.321503771594684
													},
													"nextHandle": {
														"dv": -1.3152202317053487,
														"dt": 0
													}
												},
												{
													"time": 1.0099592569159828,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Sparks",
									"enabled": false,
									"x": 2.7755575615628914e-17,
									"y": -8.881784197001252e-16,
									"z": -8.881784197001252e-16,
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"children": [
										{
											"type": "emitter",
											"name": "emitterSparks",
											"props": {
												"lifeTime": 0.5,
												"alignLockAxis": "Z",
												"burstCount": 3,
												"instScale": 10,
												"instRotation_rand": [
													0,
													0,
													360
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													1,
													0.7843137254901961,
													0.7843137254901961,
													1
												],
												"burstDelay": 0.2,
												"randomColor2": [
													0.8549019607843137,
													0.9490196078431372,
													0.996078431372549,
													1
												],
												"emitDuration": 1.3,
												"alignMode": "Screen",
												"emitRate": 4,
												"maxCount": 10,
												"warmUpTime": -0.1,
												"randomGradient": {
													"stops": [
														{
															"position": 0,
															"color": -16777216
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
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"x": 1.1102230246251565e-16,
													"y": 6.938893903907228e-18,
													"scaleZ": 0.9999999999999999,
													"kind": 1,
													"args": [
														24,
														360,
														0,
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
																	"emissive": 30
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
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.33,
																"saturation": 1,
																"width": 0.83,
																"uvScaleX": 5,
																"uvScaleY": 0.125,
																"texture": "Fx/noise/T_Noise_DirectionalSparks02.png",
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
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.6549019607843137,
																	0.5764705882352941,
																	1
																]
															}
														}
													]
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.82,
														"saturation": 1,
														"width": 0.8,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Fire.png",
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
													"isInstance": true
												},
												{
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5118219749652295,
															"value": 0,
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
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -1.4695667122012668,
																"dt": -0.36113644276397655
															},
															"nextHandle": {
																"dv": 1.5173354123320077,
																"dt": 0.3744436448880628
															}
														},
														{
															"time": 0.9999592569159829,
															"value": 2,
															"mode": 1,
															"prevHandle": {
																"dv": -0.02201704545454497,
																"dt": -0.321503771594684
															},
															"nextHandle": {
																"dv": -1.3152202317053487,
																"dt": 0
															}
														},
														{
															"time": 1.0099592569159828,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.1666971250103659,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.0106287461138725,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0222981577731134,
													"value": 0,
													"mode": 2
												}
											]
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
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.01917417074169636,
													"value": 0,
													"prevHandle": {
														"dv": 0.015960427820990455,
														"dt": -0.49990576705532597
													},
													"nextHandle": {
														"dv": -0.033333333333333326,
														"dt": 1.0440525627136237
													}
												},
												{
													"time": 2.0106287461138725,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.9666666666666667,
														"dt": -0.038011622428894
													},
													"nextHandle": {
														"dv": -0.7333333333333334,
														"dt": 0.011669411659240847
													}
												},
												{
													"time": 2.0222981577731134,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"prevHandle": {
														"dv": -0.004700613636289809,
														"dt": -0.5005297411848313
													},
													"nextHandle": {
														"dv": 0.0056499475322411286,
														"dt": 0.5136767811649875
													}
												},
												{
													"time": 0.8518688978693754,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.8223793328056753,
														"dt": -0.12311554122299306
													},
													"nextHandle": {
														"dv": -0.7333333333333334,
														"dt": 0.011669411659240847
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
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_RaisonanceDrone_Muzzle_Photosensitive",
							"source": "Fx/Vehicle/Drones/VerniusDrones/FX_RaisonanceDrone_Muzzle_Photosensitive.fx",
							"y": -5.5,
							"z": 0.1,
							"scaleX": 1.65,
							"scaleY": 1.65,
							"scaleZ": 1.65,
							"rotationZ": 89.99999999999999,
							"time": 0.905
						},
						{
							"type": "object",
							"name": "TestElec1",
							"enabled": false,
							"children": [
								{
									"type": "object",
									"name": "ElecSides",
									"enabled": false,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"children": [
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 2.05176,
											"y": -0.3188,
											"z": -0.90516,
											"scaleX": 0.2,
											"scaleY": 0.25,
											"scaleZ": 0.11000000000000001,
											"rotationX": 41.4,
											"rotationY": -7.9,
											"rotationZ": 77.7,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.6272207465733541,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8337402828565624,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.939885287475685,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -1.43849,
											"y": -1.01297,
											"z": -0.47546,
											"scaleX": 0.2,
											"scaleY": 0.17999999999999997,
											"scaleZ": 0.06,
											"rotationX": 31.3,
											"rotationZ": -48.9,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.5241557379205428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7306752742037503,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8398852874756845,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 1.53719,
											"y": 0.50646,
											"z": -0.64686,
											"scaleX": 0.16,
											"scaleY": 0.16000000000000006,
											"scaleZ": 0.06,
											"rotationX": 49.9,
											"rotationZ": 116.6,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.5241557379205428,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7306752742037503,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8398852874756845,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -1.47135,
											"y": 2.20192,
											"z": -0.80725,
											"scaleX": 0.25,
											"scaleY": 0.33,
											"scaleZ": 0.15,
											"rotationX": 27.5,
											"rotationZ": -144.55,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.7300417365456717,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9365612728288798,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9532338372166976,
																	"value": 0,
																	"mode": 2
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
									"type": "object",
									"name": "ElecSides",
									"enabled": false,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"children": [
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.22019,
											"y": -0.48394,
											"z": 0.16749,
											"scaleX": 0.2,
											"scaleY": 0.25,
											"scaleZ": 0.11000000000000001,
											"rotationZ": -4.6,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.6272207465733541,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8337402828565624,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.939885287475685,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -0.48555,
											"y": -0.98347,
											"z": 0.05073,
											"scaleX": 0.2,
											"scaleY": 0.17999999999999997,
											"scaleZ": 0.06,
											"rotationY": -19.9,
											"rotationZ": 32.1,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.40108030980461906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6075998460878266,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7168098593597607,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.47623,
											"y": -1.00804,
											"z": 0.0448,
											"scaleX": 0.16,
											"scaleY": 0.16000000000000006,
											"scaleZ": 0.06,
											"rotationZ": -28.3,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.4592024511140279,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6657219873972353,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7749320006691695,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -0.30621,
											"y": -1.02878,
											"z": 0.04568,
											"scaleX": 0.15,
											"scaleY": 0.15,
											"scaleZ": 0.15,
											"rotationZ": 29.7,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.7300417365456717,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9365612728288798,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9532338372166976,
																	"value": 0,
																	"mode": 2
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
									"type": "object",
									"name": "ElecSides",
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"children": [
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -0.50766,
											"y": -0.99897,
											"z": 0.03886,
											"scaleX": 0.2,
											"scaleY": 0.17999999999999997,
											"scaleZ": 0.06,
											"rotationX": 3.7,
											"rotationY": -69.9,
											"rotationZ": 32.1,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.40108030980461906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6075998460878266,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7168098593597607,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.54278,
											"y": -1.04914,
											"z": 0.0448,
											"scaleX": 0.16,
											"scaleY": 0.16000000000000006,
											"scaleZ": 0.06,
											"rotationZ": -31.7,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.4592024511140279,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6657219873972353,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7749320006691695,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.4731,
											"y": -0.63106,
											"z": 0.16749,
											"scaleX": 0.19999999999999996,
											"scaleY": 0.23,
											"scaleZ": 0.10999999999999999,
											"rotationZ": -15.4,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.6272207465733541,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8337402828565624,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.939885287475685,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -0.2105,
											"y": -0.9905,
											"z": 0.04568,
											"scaleX": 0.15,
											"scaleY": 0.15,
											"scaleZ": 0.15,
											"rotationZ": 23.8,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 0.25,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_09.png"
													}
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_10.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.7300417365456717,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9365612728288798,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9532338372166976,
																	"value": 0,
																	"mode": 2
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
									"type": "object",
									"name": "ElecSides",
									"enabled": false,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"children": [
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.22019,
											"y": -0.48394,
											"z": 0.16749,
											"scaleX": 0.2,
											"scaleY": 0.25,
											"scaleZ": 0.11000000000000001,
											"rotationZ": -4.6,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_14.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.6272207465733541,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8337402828565624,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.939885287475685,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -0.48555,
											"y": -0.98347,
											"z": 0.05073,
											"scaleX": 0.2,
											"scaleY": 0.17999999999999997,
											"scaleZ": 0.06,
											"rotationY": -19.9,
											"rotationZ": 32.1,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_14.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.40108030980461906,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6075998460878266,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7168098593597607,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": 0.47623,
											"y": -1.00804,
											"z": 0.0448,
											"scaleX": 0.16,
											"scaleY": 0.16000000000000006,
											"scaleZ": 0.06,
											"rotationZ": -28.3,
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
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_14.png",
														"speed": 10,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.4592024511140279,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.6657219873972353,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.7749320006691695,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "Electricity_single",
											"source": "Fx/Meshes_Common/Electricity_single.fbx",
											"x": -0.30621,
											"y": -1.02878,
											"z": 0.04568,
											"scaleX": 0.15,
											"scaleY": 0.15,
											"scaleZ": 0.15,
											"rotationZ": 29.7,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_14.png",
														"speed": 15,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": true
													}
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													}
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
																	"time": 0.7300417365456717,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9365612728288798,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9532338372166976,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
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
					"type": "object",
					"name": "bckp",
					"enabled": false,
					"rotationX": -90,
					"children": [
						{
							"type": "model",
							"name": "VerniusTesla_Torus",
							"source": "Fx/Meshes_Common/VerniusTesla_Torus.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002
						},
						{
							"type": "model",
							"name": "VerniusTesla_Lights",
							"source": "Fx/Meshes_Common/VerniusTesla_Lights.fbx",
							"z": 4.440892098500626e-16,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002
						},
						{
							"type": "object",
							"name": "Decals",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Green",
									"scaleX": 14,
									"scaleY": 14,
									"scaleZ": 6,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.580392156862745,
													0.4549019607843137,
													0.9921568627450981
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.0029112230697415985,
																"dt": -0.5004857568709588
															},
															"nextHandle": {
																"dv": 0.007747196738022488,
																"dt": 1.085995752589968
															}
														},
														{
															"time": 1.685641958570401,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9666666666666667,
																"dt": -0.038011622428894
															},
															"nextHandle": {
																"dv": -0.7333333333333334,
																"dt": 0.011669411659240847
															}
														},
														{
															"time": 1.697311370229642,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Green",
									"scaleX": 14,
									"scaleY": 14,
									"scaleZ": 6,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.580392156862745,
													0.4549019607843137,
													0.9921568627450981
												]
											}
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.03485975677854325,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.10527968055035841,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.19917291224611194,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.3480308554906656,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.13934203771706083,
																"dt": -0.0940868914220308
															},
															"nextHandle": {
																"dv": -0.0005562475711130138,
																"dt": 0.47318471673981344
															}
														},
														{
															"time": 0.8755118776817458,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9104249280187479,
															"value": 0.02163275373246143,
															"mode": 2
														},
														{
															"time": 0.9372811205856726,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9802510286927522,
															"value": 0.02494925287235139,
															"mode": 2
														},
														{
															"time": 1.036649033083294,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1118463722706833,
															"value": 0.05479774513136104,
															"mode": 2
														},
														{
															"time": 1.1924149499714574,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2971541009824636,
															"value": 0.10786173136960042,
															"mode": 2
														},
														{
															"time": 1.396522013480085,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4905186874643217,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 1.600629076988713,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.685641958570401,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.697311370229642,
															"value": 0,
															"mode": 2
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
							"type": "object",
							"name": "Decals",
							"enabled": false,
							"x": 1,
							"z": 4,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Green",
									"scaleX": 14,
									"scaleY": 14,
									"scaleZ": 6,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Gradients/circGrad05.jpg",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.580392156862745,
													0.4549019607843137,
													0.9921568627450981
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -0.0029112230697415985,
																"dt": -0.5004857568709588
															},
															"nextHandle": {
																"dv": 0.007747196738022488,
																"dt": 1.085995752589968
															}
														},
														{
															"time": 1.685641958570401,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9666666666666667,
																"dt": -0.038011622428894
															},
															"nextHandle": {
																"dv": -0.7333333333333334,
																"dt": 0.011669411659240847
															}
														},
														{
															"time": 1.697311370229642,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Green",
									"scaleX": 14,
									"scaleY": 14,
									"scaleZ": 6,
									"rotationZ": 89.99999999999999,
									"albedoMap": "Fx/Alphas/T_ChocWave_Contrast02.png",
									"fadePower": 3,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.580392156862745,
													0.4549019607843137,
													0.9921568627450981
												]
											}
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.03485975677854325,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.10527968055035841,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.19917291224611194,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.3480308554906656,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.13934203771706083,
																"dt": -0.0940868914220308
															},
															"nextHandle": {
																"dv": -0.0005562475711130138,
																"dt": 0.47318471673981344
															}
														},
														{
															"time": 0.8755118776817458,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9104249280187479,
															"value": 0.02163275373246143,
															"mode": 2
														},
														{
															"time": 0.9372811205856726,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9802510286927522,
															"value": 0.02494925287235139,
															"mode": 2
														},
														{
															"time": 1.036649033083294,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1118463722706833,
															"value": 0.05479774513136104,
															"mode": 2
														},
														{
															"time": 1.1924149499714574,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.2971541009824636,
															"value": 0.10786173136960042,
															"mode": 2
														},
														{
															"time": 1.396522013480085,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4905186874643217,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 1.600629076988713,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.685641958570401,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.697311370229642,
															"value": 0,
															"mode": 2
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
							"type": "emitter",
							"name": "emitter",
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 10,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 2,
								"instOffset": [
									0,
									0,
									7
								],
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_01.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instOffset_rand": [
									0,
									0,
									0
								],
								"instScale_rand": 0.5,
								"animationBlendBetweenFrames": false,
								"emitRate": 6,
								"emitShape": "Cylinder",
								"emitAngle": 310,
								"emitSurface": true,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
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
							},
							"z": 3.1973,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 0.5,
							"rotationZ": 180,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 1.5,
									"scaleY": 1.5,
									"scaleZ": 1.5,
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
													"emissive": 5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AnimatedTexture",
											"source": "h3d.shader.AnimatedTexture",
											"enabled": false,
											"props": {
												"useSourceUVs": false,
												"blendBetweenFrames": true,
												"startFrame": 0,
												"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
												"speed": 10,
												"frameDivision": [
													2,
													2
												],
												"totalFrames": 4,
												"startTime": 0,
												"loop": false
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5686274509803921,
													0.47058823529411764,
													1
												]
											}
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
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/clouds3.png",
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
													"keys": [
														{
															"time": 0.24726183384056316,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.3176167024895698,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.3845396263264298,
															"value": 1
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16666666666666666
															},
															"nextHandle": {
																"dv": 0,
																"dt": -0.5
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.0077249401461189915,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.20462454287806833,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.21462454287806834,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.8,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.81,
											"value": 2,
											"mode": 2
										},
										{
											"time": 2,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": ".FXRoot.Anticipation",
					"target": ".FXRoot.DroneTesla.root.JNT_Root"
				}
			]
		}
	]
}