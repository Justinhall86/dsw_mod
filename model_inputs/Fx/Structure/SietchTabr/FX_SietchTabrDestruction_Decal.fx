{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 200,
			"scaleY": 200,
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
		},
		{
			"type": "object",
			"name": "FXRoot",
			"x": -0.07,
			"y": -0.35,
			"children": [
				{
					"type": "advancedDecal",
					"name": "Decal_Large",
					"scaleX": 11.21,
					"scaleY": 11.21,
					"scaleZ": 8,
					"rotationZ": 26.799999999999997,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
					"albedoStrength": 1.2,
					"emissive": 10,
					"children": [
						{
							"type": "curve",
							"name": "color.a",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003387519215998036,
										"dt": -0.49999785004955627
									},
									"nextHandle": {
										"dv": -0.0064102564102563875,
										"dt": 0.9460974783654252
									}
								},
								{
									"time": 1.2635912547206556,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.064102564102564,
										"dt": -0.007282849836576899
									},
									"nextHandle": {
										"dv": 1.106252419248869,
										"dt": 0.00865365128665221
									}
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
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2452895164965004,
											"mode": 0,
											"prevHandle": {
												"dv": 8.828904215257502e-17,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.001248302786230171,
												"dt": 0.9017031617808938
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.24404121371027024,
												"dt": -0.003958915476976799
											},
											"nextHandle": {
												"dv": -0.48055859037408877,
												"dt": 0.005463746746433683
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.45679012345679015,
											"mode": 0,
											"prevHandle": {
												"dv": 0.005841093151857114,
												"dt": -0.4999975737989698
											},
											"nextHandle": {
												"dv": -0.00881471320428795,
												"dt": 0.8906045826347609
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.4791901641010009,
												"dt": -0.009508205050043239
											},
											"nextHandle": {
												"dv": -1.2473501324572733,
												"dt": 0.021693045781865632
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.4764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": -0.011971072864910639,
												"dt": -0.49997934012353723
											},
											"nextHandle": {
												"dv": 0.023529411764705854,
												"dt": 0.9155763857135599
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0.11764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": 0.44865414506810575,
												"dt": -0.050000000000000044
											},
											"nextHandle": {
												"dv": -0.7418653882446633,
												"dt": 0.08125157780940348
											}
										}
									]
								}
							],
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"x": 0.03,
					"y": 0.01,
					"z": 1.23,
					"scaleX": 2.42,
					"scaleY": 2.42,
					"scaleZ": 3,
					"rotationZ": 45,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.8,
					"emissive": 10,
					"children": [
						{
							"type": "curve",
							"name": "color.a",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003387519215998036,
										"dt": -0.49999785004955627
									},
									"nextHandle": {
										"dv": -0.0064102564102563875,
										"dt": 0.9460974783654252
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.064102564102564,
										"dt": -0.007282849836576899
									},
									"nextHandle": {
										"dv": 1.106252419248869,
										"dt": 0.00865365128665221
									}
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
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2452895164965004,
											"mode": 0,
											"prevHandle": {
												"dv": 8.828904215257502e-17,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.001248302786230171,
												"dt": 0.9017031617808938
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.24404121371027024,
												"dt": -0.003958915476976799
											},
											"nextHandle": {
												"dv": -0.48055859037408877,
												"dt": 0.005463746746433683
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.45679012345679015,
											"mode": 0,
											"prevHandle": {
												"dv": 0.005841093151857114,
												"dt": -0.4999975737989698
											},
											"nextHandle": {
												"dv": -0.00881471320428795,
												"dt": 0.8906045826347609
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.4791901641010009,
												"dt": -0.009508205050043239
											},
											"nextHandle": {
												"dv": -1.2473501324572733,
												"dt": 0.021693045781865632
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.4764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": -0.011971072864910639,
												"dt": -0.49997934012353723
											},
											"nextHandle": {
												"dv": 0.023529411764705854,
												"dt": 0.9155763857135599
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0.11764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": 0.44865414506810575,
												"dt": -0.050000000000000044
											},
											"nextHandle": {
												"dv": -0.7418653882446633,
												"dt": 0.08125157780940348
											}
										}
									]
								}
							],
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"x": 0.9,
					"y": 1.53,
					"scaleX": 3.76,
					"scaleY": 3.76,
					"scaleZ": 3,
					"rotationZ": -17.2,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.9,
					"emissive": 10,
					"children": [
						{
							"type": "curve",
							"name": "color.a",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003387519215998036,
										"dt": -0.49999785004955627
									},
									"nextHandle": {
										"dv": -0.0064102564102563875,
										"dt": 0.9460974783654252
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.064102564102564,
										"dt": -0.007282849836576899
									},
									"nextHandle": {
										"dv": 1.106252419248869,
										"dt": 0.00865365128665221
									}
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
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2452895164965004,
											"mode": 0,
											"prevHandle": {
												"dv": 8.828904215257502e-17,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.001248302786230171,
												"dt": 0.9017031617808938
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.24404121371027024,
												"dt": -0.003958915476976799
											},
											"nextHandle": {
												"dv": -0.48055859037408877,
												"dt": 0.005463746746433683
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.45679012345679015,
											"mode": 0,
											"prevHandle": {
												"dv": 0.005841093151857114,
												"dt": -0.4999975737989698
											},
											"nextHandle": {
												"dv": -0.00881471320428795,
												"dt": 0.8906045826347609
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.4791901641010009,
												"dt": -0.009508205050043239
											},
											"nextHandle": {
												"dv": -1.2473501324572733,
												"dt": 0.021693045781865632
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.4764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": -0.011971072864910639,
												"dt": -0.49997934012353723
											},
											"nextHandle": {
												"dv": 0.023529411764705854,
												"dt": 0.9155763857135599
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0.11764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": 0.44865414506810575,
												"dt": -0.050000000000000044
											},
											"nextHandle": {
												"dv": -0.7418653882446633,
												"dt": 0.08125157780940348
											}
										}
									]
								}
							],
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"x": -0.79,
					"y": 1.34,
					"scaleX": 2.9,
					"scaleY": 3.76,
					"scaleZ": 3,
					"rotationZ": 24.5,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.9,
					"emissive": 10,
					"children": [
						{
							"type": "curve",
							"name": "color.a",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003387519215998036,
										"dt": -0.49999785004955627
									},
									"nextHandle": {
										"dv": -0.0064102564102563875,
										"dt": 0.9460974783654252
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.064102564102564,
										"dt": -0.007282849836576899
									},
									"nextHandle": {
										"dv": 1.106252419248869,
										"dt": 0.00865365128665221
									}
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
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2452895164965004,
											"mode": 0,
											"prevHandle": {
												"dv": 8.828904215257502e-17,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.001248302786230171,
												"dt": 0.9017031617808938
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.24404121371027024,
												"dt": -0.003958915476976799
											},
											"nextHandle": {
												"dv": -0.48055859037408877,
												"dt": 0.005463746746433683
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.45679012345679015,
											"mode": 0,
											"prevHandle": {
												"dv": 0.005841093151857114,
												"dt": -0.4999975737989698
											},
											"nextHandle": {
												"dv": -0.00881471320428795,
												"dt": 0.8906045826347609
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.4791901641010009,
												"dt": -0.009508205050043239
											},
											"nextHandle": {
												"dv": -1.2473501324572733,
												"dt": 0.021693045781865632
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.4764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": -0.011971072864910639,
												"dt": -0.49997934012353723
											},
											"nextHandle": {
												"dv": 0.023529411764705854,
												"dt": 0.9155763857135599
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0.11764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": 0.44865414506810575,
												"dt": -0.050000000000000044
											},
											"nextHandle": {
												"dv": -0.7418653882446633,
												"dt": 0.08125157780940348
											}
										}
									]
								}
							],
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"x": 0.9,
					"y": -2.13,
					"scaleX": 3.76,
					"scaleY": 3.76,
					"scaleZ": 3,
					"rotationZ": 23.9,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.8,
					"emissive": 10,
					"children": [
						{
							"type": "curve",
							"name": "color.a",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003387519215998036,
										"dt": -0.49999785004955627
									},
									"nextHandle": {
										"dv": -0.0064102564102563875,
										"dt": 0.9460974783654252
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.064102564102564,
										"dt": -0.007282849836576899
									},
									"nextHandle": {
										"dv": 1.106252419248869,
										"dt": 0.00865365128665221
									}
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
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2452895164965004,
											"mode": 0,
											"prevHandle": {
												"dv": 8.828904215257502e-17,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.001248302786230171,
												"dt": 0.9017031617808938
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.24404121371027024,
												"dt": -0.003958915476976799
											},
											"nextHandle": {
												"dv": -0.48055859037408877,
												"dt": 0.005463746746433683
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.45679012345679015,
											"mode": 0,
											"prevHandle": {
												"dv": 0.005841093151857114,
												"dt": -0.4999975737989698
											},
											"nextHandle": {
												"dv": -0.00881471320428795,
												"dt": 0.8906045826347609
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.4791901641010009,
												"dt": -0.009508205050043239
											},
											"nextHandle": {
												"dv": -1.2473501324572733,
												"dt": 0.021693045781865632
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.4764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": -0.011971072864910639,
												"dt": -0.49997934012353723
											},
											"nextHandle": {
												"dv": 0.023529411764705854,
												"dt": 0.9155763857135599
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0.11764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": 0.44865414506810575,
												"dt": -0.050000000000000044
											},
											"nextHandle": {
												"dv": -0.7418653882446633,
												"dt": 0.08125157780940348
											}
										}
									]
								}
							],
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"x": -1.6,
					"y": 0.08,
					"scaleX": 5.849999999999999,
					"scaleY": 5.849999999999999,
					"scaleZ": 5,
					"rotationZ": 55.5,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.8,
					"emissive": 10,
					"children": [
						{
							"type": "curve",
							"name": "color.a",
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.003387519215998036,
										"dt": -0.49999785004955627
									},
									"nextHandle": {
										"dv": -0.0064102564102563875,
										"dt": 0.9460974783654252
									}
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.064102564102564,
										"dt": -0.007282849836576899
									},
									"nextHandle": {
										"dv": 1.106252419248869,
										"dt": 0.00865365128665221
									}
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
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.2452895164965004,
											"mode": 0,
											"prevHandle": {
												"dv": 8.828904215257502e-17,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": -0.001248302786230171,
												"dt": 0.9017031617808938
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.24404121371027024,
												"dt": -0.003958915476976799
											},
											"nextHandle": {
												"dv": -0.48055859037408877,
												"dt": 0.005463746746433683
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.45679012345679015,
											"mode": 0,
											"prevHandle": {
												"dv": 0.005841093151857114,
												"dt": -0.4999975737989698
											},
											"nextHandle": {
												"dv": -0.00881471320428795,
												"dt": 0.8906045826347609
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.4791901641010009,
												"dt": -0.009508205050043239
											},
											"nextHandle": {
												"dv": -1.2473501324572733,
												"dt": 0.021693045781865632
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.4764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": -0.011971072864910639,
												"dt": -0.49997934012353723
											},
											"nextHandle": {
												"dv": 0.023529411764705854,
												"dt": 0.9155763857135599
											}
										},
										{
											"time": 1.3718024013954513,
											"value": 0.11764705882352941,
											"mode": 0,
											"prevHandle": {
												"dv": 0.44865414506810575,
												"dt": -0.050000000000000044
											},
											"nextHandle": {
												"dv": -0.7418653882446633,
												"dt": 0.08125157780940348
											}
										}
									]
								}
							],
							"isInstance": true
						}
					]
				}
			]
		}
	]
}