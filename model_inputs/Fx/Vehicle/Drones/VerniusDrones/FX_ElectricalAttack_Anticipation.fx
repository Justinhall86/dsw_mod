{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 150,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
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
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "FolderRelay",
					"source": "Vehicle/Vernius/FolderRelay/FolderRelay.fbx",
					"editorOnly": true,
					"z": -3,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/FolderRelay/Anim_FolderRelay_AttackRange.fbx"
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
							"name": "Gun",
							"y": 0.00153,
							"z": -2.46039,
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
										},
										{
											"type": "polygon",
											"name": "polygon",
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
										"warmUpTime": 0.1
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
													"mode": 0,
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
												"warmUpTime": -0.1
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
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
							"name": "FX_RaisonanceDrone_Muzzle",
							"source": "Fx/Vehicle/Drones/VerniusDrones/FX_RaisonanceDrone_Muzzle.fx",
							"y": 0.00153,
							"z": -2.68963,
							"rotationY": -90,
							"time": 0.905
						},
						{
							"type": "object",
							"name": "TestElec1",
							"children": [
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
											"x": -0.40666,
											"y": -0.25111,
											"z": -0.33169,
											"scaleX": 0.13,
											"scaleY": 0.12,
											"scaleZ": 0.03,
											"rotationX": 133.1,
											"rotationY": 0.4,
											"rotationZ": -59.6,
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
											"x": 0.41314,
											"y": -0.2433,
											"z": -0.30775,
											"scaleX": 0.11,
											"scaleY": 0.11,
											"scaleZ": 0.04,
											"rotationX": 130.9,
											"rotationZ": 61.6,
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
											"x": -0.05606,
											"y": -0.14279,
											"z": -0.32851,
											"scaleX": 0.12,
											"scaleY": 0.09,
											"scaleZ": 0.1,
											"rotationX": 121.1,
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
											"x": 0.1356,
											"y": 0.16139,
											"z": -0.31732,
											"scaleX": 0.12,
											"scaleY": 0.09,
											"scaleZ": 0.1,
											"rotationX": 112,
											"rotationZ": 152.7,
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
											"x": 0.1356,
											"y": 0.16139,
											"z": -0.31732,
											"scaleX": 0.12,
											"scaleY": 0.09,
											"scaleZ": 0.1,
											"rotationX": 112,
											"rotationZ": 152.7,
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
																	"time": 0.706296475738172,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9128160120213794,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.022026025293314,
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
											"x": 0.01671,
											"y": 0.47531,
											"z": -0.33025,
											"scaleX": 0.15,
											"scaleY": 0.12,
											"scaleZ": 0.03,
											"rotationX": -46.36,
											"rotationY": 180,
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
											"x": -0.38388,
											"y": -0.23523,
											"z": -0.32941,
											"scaleX": 0.15,
											"scaleY": 0.12,
											"scaleZ": 0.02,
											"rotationX": 134.3,
											"rotationZ": -60.8,
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
								}
							]
						},
						{
							"type": "object",
							"name": "LIGHTS",
							"children": [
								{
									"type": "model",
									"name": "VerniusFregate_LightsPole",
									"source": "Fx/Meshes_Common/VerniusFregate_Lights.fbx",
									"z": -4.02,
									"rotationZ": -60,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 15,
													"alphaKill": true,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
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
															"time": 0.9406948488889937,
															"value": 0.970407296131008,
															"mode": 0,
															"prevHandle": {
																"dv": 1.7114007151697584e-16,
																"dt": -0.5674391129367944
															},
															"nextHandle": {
																"dv": 0.0019703265179746854,
																"dt": 0.11866563460755652
															}
														},
														{
															"time": 1.0011064446892044,
															"value": 0,
															"mode": 0
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
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.27058823529411763,
													0.1764705882352941,
													0.996078431372549
												]
											}
										}
									]
								},
								{
									"type": "model",
									"name": "VerniusFregate_LightsPole",
									"source": "Fx/Meshes_Common/VerniusFregate_LightsPole.fbx",
									"z": -4.02,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 8,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"refMatLib": ""
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0.98,
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
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9406948488889937,
															"value": 0.970407296131008,
															"mode": 0,
															"prevHandle": {
																"dv": 1.7114007151697584e-16,
																"dt": -0.5674391129367944
															},
															"nextHandle": {
																"dv": 0.0019703265179746854,
																"dt": 0.11866563460755652
															}
														},
														{
															"time": 1.0011064446892044,
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
													0.33725490196078434,
													0.27058823529411763,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.9,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitterElec",
							"enabled": false,
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
								"emitAngle": 360,
								"emitSurface": true,
								"instScale": 0.95
							},
							"z": -2.55413,
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
															"value": 1,
															"mode": 0
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
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
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Anticipation",
					"target": "FXAnimation.FXRoot.FolderRelay.root.JNT_Root"
				}
			]
		}
	]
}