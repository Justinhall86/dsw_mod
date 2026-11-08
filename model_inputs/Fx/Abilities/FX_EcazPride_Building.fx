{
	"type": "fx",
	"cullingRadius": 10000,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"rotationZ": 90,
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"locked": true,
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
					"name": "Buildings",
					"z": 1,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "object",
							"name": "Building01",
							"z": -0.72671,
							"children": [
								{
									"type": "object",
									"name": "BuildingModels",
									"editorOnly": true,
									"z": 0.19999999999999996,
									"children": [
										{
											"type": "reference",
											"name": "Prefab_MarketPlace",
											"source": "Structure/Buildings/MarketPlace/Prefab_MarketPlace.prefab",
											"enabled": false,
											"z": 0.02671000000000001,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "reference",
											"name": "Prefab_ListeningPoqt",
											"source": "Structure/Buildings/ListeningPost/Prefab_ListeningPost.prefab",
											"enabled": false,
											"z": 0.02671000000000001,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "reference",
											"name": "Prefab_SpiceSilo",
											"source": "Structure/Buildings/SpiceSilo/Prefab_SpiceSilo.prefab",
											"enabled": false,
											"z": 0.02671000000000001,
											"scaleX": 0.5,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "reference",
											"name": "Prefab_CraftWorkshop",
											"source": "Structure/Buildings/CraftWorkshop/Prefab_CraftWorkshop.prefab",
											"z": 5.551115123125783e-17,
											"scaleX": 1.0000000000000007,
											"scaleY": 1.0000000000000007,
											"rotationZ": -89.99999999999999
										}
									]
								},
								{
									"type": "object",
									"name": "Plants",
									"y": 3.00548,
									"z": 0.2,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"children": [
										{
											"type": "model",
											"name": "Bush03",
											"source": "Environment/Asset/Bush/Bush03.fbx",
											"x": 0.53769,
											"y": -2.21189,
											"z": 0.55734,
											"scaleX": 0.6,
											"scaleY": 0.6,
											"scaleZ": 0.6,
											"rotationZ": 102.2
										},
										{
											"type": "model",
											"name": "Bush04",
											"source": "Environment/Asset/Bush/Bush04.fbx",
											"x": -3.50208,
											"y": -4.56756,
											"z": -0.09262,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "model",
											"name": "Bush05",
											"source": "Environment/Asset/Bush/Bush05.fbx",
											"x": 2.53869,
											"y": -8.97222,
											"z": 0.24341,
											"scaleZ": 0.9999999999999996,
											"rotationX": -9.54166404439055e-15,
											"rotationY": 6.3611093629270335e-15,
											"rotationZ": -90
										},
										{
											"type": "model",
											"name": "Bush06",
											"source": "Environment/Asset/Bush/Bush06.fbx",
											"x": 2.87111,
											"y": -7.89214,
											"z": -0.38706,
											"scaleX": 1.0000000000000004,
											"scaleY": 1.000000000000001,
											"scaleZ": 1.0000000000000007,
											"rotationX": 2.4265706493099313e-20,
											"rotationZ": -89.99999999999999
										},
										{
											"type": "shader",
											"name": "DissolveBurn",
											"source": "hrt.shader.DissolveBurn",
											"props": {
												"noiseScale": [
													1,
													1
												],
												"noiseOffset": [
													0,
													0
												],
												"dissolveWidth": 0.52,
												"alphaThreshold": 1,
												"dissolveAmmount": 1,
												"noise": "Fx/noise/clouds_Dissolve.png",
												"colorBurn": [
													1,
													0,
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "dissolveAmmount",
													"keys": [
														{
															"time": 0.29948194467657974,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
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
													0.6352941176470588,
													0.20784313725490194
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.0219694481914594,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0011111111111110628,
																"dt": -0.31627922025280153
															},
															"nextHandle": {
																"dv": -8.233570609255697e-18,
																"dt": 0.01582939186979605
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
									"name": "advancedDecal_Foliage",
									"locked": true,
									"z": 0.2,
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 3.5,
									"rotationZ": -46,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"albedoStrength": 2,
									"fadePower": 1.68,
									"renderMode": "BeforeTonemapping",
									"children": [
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
												"texture": "Fx/Alphas/T_VegetationDecal.png"
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -14668531
															},
															{
																"position": 1,
																"color": -9143745
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 2,
												"color": [
													1,
													0.6352941176470588,
													0.20784313725490194
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9336255656671337,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9336255656671337,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0011111111111110628,
																"dt": -0.31627922025280153
															},
															"nextHandle": {
																"dv": -8.233570609255697e-18,
																"dt": 0.01582939186979605
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/clouds_Dissolve.png",
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
															"time": 0.29948194467657974,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "width",
													"keys": [
														{
															"time": 0.29948194467657974,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0219694481914594,
															"value": 1,
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
		}
	]
}