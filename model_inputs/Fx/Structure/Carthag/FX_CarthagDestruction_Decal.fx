{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"x": -3.700743415417188e-17,
			"y": 1.1102230246251565e-16,
			"z": 7.401486830834377e-17,
			"children": [
				{
					"type": "advancedDecal",
					"name": "Decal_Large",
					"x": -0.08166666666666664,
					"y": -0.6516666666666667,
					"z": -0.27166666666666667,
					"scaleX": 12.64,
					"scaleY": 12.64,
					"scaleZ": 5.45,
					"rotationZ": -141.3,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
					"albedoStrength": 1.2,
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
					"x": 0.5383333333333333,
					"y": -1.3416666666666668,
					"z": 1.3583333333333334,
					"scaleX": 2.42,
					"scaleY": 2.42,
					"scaleZ": 2.62,
					"rotationZ": 28.30000000000001,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.8,
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
					"x": -2.0616666666666665,
					"y": -0.4416666666666667,
					"z": -0.27166666666666667,
					"scaleX": 5.849999999999999,
					"scaleY": 5.849999999999999,
					"scaleZ": 3.06,
					"rotationZ": 55.5,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.9,
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
					"x": 1.4883333333333333,
					"y": -1.4916666666666667,
					"z": -0.27166666666666667,
					"scaleX": 3.76,
					"scaleY": 3.76,
					"scaleZ": 1.97,
					"rotationZ": 23.89999999999999,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.9,
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
					"x": -1.1116666666666668,
					"y": 2.0283333333333333,
					"z": -0.27166666666666667,
					"scaleX": 2.9,
					"scaleY": 3.76,
					"scaleZ": 3.86,
					"rotationZ": 24.5,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.8,
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
					"x": 1.2283333333333333,
					"y": 1.8983333333333334,
					"z": -0.27166666666666667,
					"scaleX": 3.76,
					"scaleY": 3.76,
					"scaleZ": 1.97,
					"rotationZ": -31.39999999999999,
					"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
					"albedoStrength": 0.9,
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
				}
			]
		}
	]
}