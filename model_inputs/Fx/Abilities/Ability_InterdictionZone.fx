{
	"type": "fx",
	"cullingRadius": 75,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.8,
			"scaleY": 0.8,
			"scaleZ": 0.8,
			"rotationZ": 90,
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
					"name": "InterdictionVillage",
					"scaleX": 0.55,
					"scaleY": 0.55,
					"scaleZ": 0.55,
					"children": [
						{
							"type": "object",
							"name": "test1",
							"children": [
								{
									"type": "advancedDecal",
									"name": "outsidecircle",
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 50,
									"rotationZ": -26.71515414426689,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Target1.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.46,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0.5,
													"mode": 2
												}
											]
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
													"time": 1.4949999999999999,
													"value": 0.99,
													"mode": 0,
													"prevHandle": {
														"dv": -0.125,
														"dt": -1.085
													},
													"nextHandle": {
														"dv": 0.0191555190995555,
														"dt": 0.1662699057841416
													}
												},
												{
													"time": 1.9999999999999998,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 1,
													"mode": 0
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "insidecircle",
									"scaleX": 20,
									"scaleY": 20,
									"scaleZ": 4.68,
									"rotationZ": 40,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
									"emissive": 0.5,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Alphas/FloorScan_Round_12_1024_thick.png"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.46,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.5,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4949999999999999,
													"value": 0.01,
													"mode": 0,
													"prevHandle": {
														"dv": 0.004397321428571419,
														"dt": -1.0511728395061728
													},
													"nextHandle": {
														"dv": -0.0007187892533181729,
														"dt": 0.1671095069447516
													}
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0,
													"mode": 0
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "trai",
									"scaleX": 30.5,
									"scaleY": 1.5,
									"scaleZ": 50,
									"rotationZ": -45.00000000000001,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 3,
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
												"alpha": 0.75,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 1,
												"vOffset": 1,
												"texture": "Fx/Gradients/Cyl02u_A.jpg"
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.46,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.5,
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
						}
					]
				},
				{
					"type": "object",
					"name": "InterdictionRegion",
					"enabled": false,
					"scaleX": 0.55,
					"scaleY": 0.55,
					"scaleZ": 0.55,
					"children": [
						{
							"type": "advancedDecal",
							"name": "growingcircle",
							"enabled": false,
							"scaleX": 2.2727272727272725,
							"scaleY": 2.2727272727272725,
							"scaleZ": 2.2727272727272725,
							"rotationZ": -89.99999999999999,
							"albedoMap": "Fx/Alphas/T-InnerGradient.png",
							"fadeStart": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.46,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9949999999999999,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.5,
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
									"enabled": false,
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.187037037037037,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -1.2324051059924013,
												"dt": -1.832211209568279
											},
											"nextHandle": {
												"dv": 0.4201235451904888,
												"dt": 0.6255555555555555
											}
										},
										{
											"time": 1.2928395061728395,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0037229339507492965,
												"dt": -0.22876543209876554
											},
											"nextHandle": {
												"dv": -0.0027194816775288912,
												"dt": 0.18997176610430994
											}
										},
										{
											"time": 2.5,
											"value": 0.9,
											"mode": 0
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.187037037037037,
											"value": 0.5,
											"mode": 0,
											"prevHandle": {
												"dv": -1.2324051059924013,
												"dt": -1.832211209568279
											},
											"nextHandle": {
												"dv": 0.4201235451904888,
												"dt": 0.6255555555555555
											}
										},
										{
											"time": 1.2928395061728395,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0037229339507492965,
												"dt": -0.22876543209876554
											},
											"nextHandle": {
												"dv": -0.0027194816775288912,
												"dt": 0.18997176610430994
											}
										},
										{
											"time": 2.5,
											"value": 0.9,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "growingcircle",
							"scaleX": 250,
							"scaleY": 250,
							"scaleZ": 70.17809825027207,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadeStart": 1,
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.3,
										"saturation": 0.5,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Alphas/T-InnerGradient.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "outsidecircle",
							"scaleX": 120,
							"scaleY": 120,
							"scaleZ": 28.1,
							"rotationZ": -25.777962230562615,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 0.5,
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
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_12_1024_thick.png"
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4949999999999999,
											"value": 0.01,
											"mode": 0,
											"prevHandle": {
												"dv": 0.004397321428571419,
												"dt": -1.0511728395061728
											},
											"nextHandle": {
												"dv": -0.0007187892533181729,
												"dt": 0.1671095069447516
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.5,
											"value": 0,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Border",
							"x": -1.7763568394002505e-15,
							"scaleX": 225.00000000000003,
							"scaleY": 225.00000000000003,
							"scaleZ": 100,
							"rotationZ": 134.80136387471205,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 0.52,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_13_1024.png"
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
											"time": 1.4949999999999999,
											"value": 0.99,
											"mode": 0,
											"prevHandle": {
												"dv": -0.125,
												"dt": -1.085
											},
											"nextHandle": {
												"dv": 0.0191555190995555,
												"dt": 0.1662699057841416
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.5,
											"value": 1,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "trai",
							"scaleX": 194.00000000000003,
							"scaleY": 4,
							"scaleZ": 50,
							"rotationZ": -45.00000000000001,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
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
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
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
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.46,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9949999999999999,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9999999999999998,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.5,
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
					"type": "object",
					"name": "Village",
					"editorOnly": true,
					"z": 1.2,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "object",
							"name": "group",
							"x": 0.096,
							"y": 0.393174,
							"z": -0.8080719999999999,
							"rotationZ": 6.599999999999998,
							"children": [
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
				}
			]
		}
	]
}