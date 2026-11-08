{
	"type": "fx",
	"cullingRadius": 60,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
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
					"name": "AoE",
					"scaleX": 0.118,
					"scaleY": 0.118,
					"scaleZ": 0.118,
					"children": [
						{
							"type": "advancedDecal",
							"name": "CIRCLE",
							"scaleX": 77.5,
							"scaleY": 77.5,
							"scaleZ": 38.75,
							"rotationZ": 104.97997329773031,
							"albedoMap": "Fx/Alphas/T_Target1_thick_02.png",
							"fadeStart": 0.95,
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
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
													"time": 1.0202095215426412,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 1.1807360569231484,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0.25,
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 15,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CircleCut_Small",
							"scaleX": 115,
							"scaleY": 115,
							"scaleZ": 103.5,
							"rotationZ": -5.617489986648867,
							"albedoMap": "Fx/Alphas/T_circle_2_Thick.png",
							"fadeStart": 0.95,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 40,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0.5711204173953244,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5969833100995159,
													"value": 2,
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
							"type": "advancedDecal",
							"name": "CircleCut",
							"scaleX": 155,
							"scaleY": 155,
							"scaleZ": 93,
							"albedoMap": "Fx/Alphas/T_circle_2_Thick.png",
							"fadeStart": 0.95,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 40,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0.33203238563257154,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.35789527833676305,
													"value": 2,
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
							"type": "advancedDecal",
							"name": "GrowingCircle",
							"scaleX": 200,
							"scaleY": 200,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_LensFlare_07.png"
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
									"name": "scale",
									"keyMode": 1,
									"loop": true,
									"keys": [
										{
											"time": 0.187037037037037,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -1.2324051059924013,
												"dt": -1.832211209568279
											},
											"nextHandle": {
												"dv": -0.7093091109516947,
												"dt": 0.5539509469416012
											}
										},
										{
											"time": 1.2928395061728395,
											"value": 0.35,
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
											"value": 0.35,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "GlowingCircle",
							"scaleX": 200,
							"scaleY": 200,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_LensFlare_07.png"
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "RangeBorder",
							"scaleX": 195,
							"scaleY": 195,
							"scaleZ": 170,
							"rotationZ": 90,
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
										"alpha": 0.25,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_13_1024.png"
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
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.08470261295721569,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0.25,
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
											"time": 15,
											"value": 0,
											"mode": 2
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
						},
						{
							"type": "model",
							"name": "WayPointMesh",
							"source": "Fx/Meshes_Common/WayPointMesh02.fbx",
							"z": 0.5,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 0.1,
							"rotationZ": -20,
							"lockAnimation": true,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Overlay",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual"
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
										"alpha": 1.1,
										"uScale": 0.75,
										"vScale": 0.89,
										"uOffset": 0,
										"vOffset": -0.6,
										"texture": "Fx/Alphas/T_ArrowPing_3.png"
									},
									"recursiveApply": false,
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
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 1.249000902703301e-16,
											"value": 0.65,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.030000000000000002
											},
											"nextHandle": {
												"dv": 0.00221205979209671,
												"dt": 0.09999999999999987
											}
										},
										{
											"time": 0.625,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": -0.008223530747719532,
												"dt": -0.135
											},
											"nextHandle": {
												"dv": -0.008223530747719532,
												"dt": 0.13
											}
										},
										{
											"time": 1.25,
											"value": 0.65,
											"mode": 0,
											"prevHandle": {
												"dv": -0.006332351939210279,
												"dt": -0.125
											},
											"nextHandle": {
												"dv": 0.006332351939210279,
												"dt": 0.125
											}
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
											"time": 1.249000902703301e-16,
											"value": 0.65,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.030000000000000002
											},
											"nextHandle": {
												"dv": 0.00221205979209671,
												"dt": 0.09999999999999987
											}
										},
										{
											"time": 1.25,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": -0.008223530747719532,
												"dt": -0.135
											},
											"nextHandle": {
												"dv": -0.008223530747719532,
												"dt": 0.13
											}
										},
										{
											"time": 2.5,
											"value": 0.65,
											"mode": 0,
											"prevHandle": {
												"dv": -0.006332351939210279,
												"dt": -0.125
											},
											"nextHandle": {
												"dv": 0.006332351939210279,
												"dt": 0.125
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.64,
										"saturation": 1,
										"width": 0.36,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
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
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "AoE",
					"enabled": false,
					"scaleX": 0.118,
					"scaleY": 0.118,
					"scaleZ": 0.118,
					"children": [
						{
							"type": "advancedDecal",
							"name": "CIRCLE",
							"scaleX": 39.99999999999999,
							"scaleY": 39.99999999999999,
							"scaleZ": 19.999999999999996,
							"rotationZ": 104.97997329773031,
							"albedoMap": "Fx/Alphas/T_Target1_thick_02.png",
							"fadeStart": 0.95,
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
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
													"time": 1.0202095215426412,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 1.1807360569231484,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0.25,
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
											"value": 0,
											"mode": 2
										},
										{
											"time": 15,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "CircleCut_Small",
							"scaleX": 99.99999999999999,
							"scaleY": 99.99999999999999,
							"scaleZ": 90,
							"rotationZ": -5.617489986648867,
							"albedoMap": "Fx/Alphas/T_circle_2_Thick.png",
							"fadeStart": 0.95,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 40,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0.5974632843791723,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.6233261770833638,
													"value": 2,
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
							"type": "advancedDecal",
							"name": "CircleCut",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 90,
							"albedoMap": "Fx/Alphas/T_circle_2_Thick.png",
							"fadeStart": 0.95,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
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
											"time": 40,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.1
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0.36715620827770357,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3930191009818951,
													"value": 2,
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
							"type": "advancedDecal",
							"name": "GrowingCircle",
							"scaleX": 200,
							"scaleY": 200,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_LensFlare_07.png"
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
									"name": "scale",
									"keyMode": 1,
									"loop": true,
									"keys": [
										{
											"time": 0.187037037037037,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -1.2324051059924013,
												"dt": -1.832211209568279
											},
											"nextHandle": {
												"dv": -0.7093091109516947,
												"dt": 0.5539509469416012
											}
										},
										{
											"time": 1.2928395061728395,
											"value": 0.18,
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
											"value": 0.18,
											"mode": 0
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "GlowingCircle",
							"scaleX": 200,
							"scaleY": 200,
							"scaleZ": 50,
							"rotationZ": 89.99999999999999,
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_LensFlare_07.png"
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "RangeBorder",
							"scaleX": 195,
							"scaleY": 195,
							"scaleZ": 170,
							"rotationZ": 90,
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
										"alpha": 0.25,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/FloorScan_Round_13_1024.png"
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
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.08470261295721569,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 2.5,
													"value": 0.25,
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
											"time": 15,
											"value": 0,
											"mode": 2
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
						},
						{
							"type": "model",
							"name": "WayPointMesh",
							"source": "Fx/Meshes_Common/WayPointMesh02.fbx",
							"z": 0.5,
							"scaleX": 40,
							"scaleY": 40,
							"scaleZ": 0.1,
							"rotationZ": -20,
							"lockAnimation": true,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Overlay",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"depthTest": "LessEqual",
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
										"alpha": 1.1,
										"uScale": 0.75,
										"vScale": 0.89,
										"uOffset": 0,
										"vOffset": -0.6,
										"texture": "Fx/Alphas/T_ArrowPing_3.png"
									},
									"recursiveApply": false,
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
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 1.249000902703301e-16,
											"value": 0.65,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.030000000000000002
											},
											"nextHandle": {
												"dv": 0.00221205979209671,
												"dt": 0.09999999999999987
											}
										},
										{
											"time": 0.625,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": -0.008223530747719532,
												"dt": -0.135
											},
											"nextHandle": {
												"dv": -0.008223530747719532,
												"dt": 0.13
											}
										},
										{
											"time": 1.25,
											"value": 0.65,
											"mode": 0,
											"prevHandle": {
												"dv": -0.006332351939210279,
												"dt": -0.125
											},
											"nextHandle": {
												"dv": 0.006332351939210279,
												"dt": 0.125
											}
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
											"time": 1.249000902703301e-16,
											"value": 0.65,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.030000000000000002
											},
											"nextHandle": {
												"dv": 0.00221205979209671,
												"dt": 0.09999999999999987
											}
										},
										{
											"time": 1.25,
											"value": 0.5,
											"mode": 1,
											"prevHandle": {
												"dv": -0.008223530747719532,
												"dt": -0.135
											},
											"nextHandle": {
												"dv": -0.008223530747719532,
												"dt": 0.13
											}
										},
										{
											"time": 2.5,
											"value": 0.65,
											"mode": 0,
											"prevHandle": {
												"dv": -0.006332351939210279,
												"dt": -0.125
											},
											"nextHandle": {
												"dv": 0.006332351939210279,
												"dt": 0.125
											}
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.64,
										"saturation": 1,
										"width": 0.36,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad.png",
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
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "Village",
					"editorOnly": true,
					"z": 1,
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
				}
			]
		}
	]
}