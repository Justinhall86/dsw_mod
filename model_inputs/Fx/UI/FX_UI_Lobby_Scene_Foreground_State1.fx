{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Pulse",
					"scaleX": 1.17,
					"scaleY": 1.17,
					"scaleZ": 1.17,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationX": 1.6721165498415313e-15,
									"rotationY": -18,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.2,
											"scaleY": 1.2,
											"scaleZ": 1.2,
											"rotationY": 90,
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
															"depthTest": "LessEqual"
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.32624999999999993,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.8262499999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 1.32625,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
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
															"time": 0.3262500000000004,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 0.8262500000000004,
															"value": 0.98,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 1.3262500000000004,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
						},
						{
							"type": "object",
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": -89.99999999999997,
											"rotationY": -26.323708890336036,
											"rotationZ": -90.00000000000004,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.2318749999999987,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.7318749999999987,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.169999999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 150,
															"value": 1,
															"mode": 2
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
															"time": 1.2318749999999987,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 1.7318749999999987,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 2.169999999999998,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_DottedLines",
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationX": -7.061204112370308e-15,
											"rotationY": 89.568,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.400624999999998,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 1.900624999999998,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.3893749999999967,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 500,
															"value": 0,
															"mode": 2
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
															"time": 1.3387499999999983,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 1.8387499999999983,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 2.327499999999997,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.22,
											"scaleY": 1.2,
											"scaleZ": 1.2,
											"rotationY": 90,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 1.5918749999999982,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 2.0299999999999976,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 2.535624999999997,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
															}
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
															"time": 1.451249999999999,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.08333333333333331
															}
														},
														{
															"time": 1.8893749999999985,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 4.060759950527971e-18,
																"dt": -0.2238206941393043
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.254375
															}
														},
														{
															"time": 2.394999999999998,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08333333333333333
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3499999999999999
															}
														},
														{
															"time": 6,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"enabled": false,
									"props": {
										"alpha": 1
									}
								}
							]
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
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 11,
											"value": 1.0277777777777777,
											"mode": 2
										},
										{
											"time": 12,
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
					"name": "Disappear",
					"enabled": false,
					"scaleX": 1.1,
					"scaleY": 1.1,
					"scaleZ": 1.1,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationX": 1.6721165498415313e-15,
									"rotationY": -18,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.2,
											"scaleY": 1.2,
											"scaleZ": 1.2,
											"rotationY": 90,
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
															"depthTest": "LessEqual"
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.32624999999999993,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08333333333333331
																	}
																},
																{
																	"time": 0.8262499999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 4.060759950527971e-18,
																		"dt": -0.2238206941393043
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.254375
																	}
																},
																{
																	"time": 1.32625,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08333333333333333
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3499999999999999
																	}
																},
																{
																	"time": 4,
																	"value": 0.7,
																	"mode": 0
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 2.9213984567260063,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0241068887281497,
																		"dt": -0.49913718658749795
																	},
																	"nextHandle": {
																		"dv": -0.014411940959194514,
																		"dt": 0.3063455200195313
																	}
																},
																{
																	"time": 6.767873281236523,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.005717571252654929,
																		"dt": -1.2826918050600224
																	},
																	"nextHandle": {
																		"dv": 0.007959353071865528,
																		"dt": 1.3800579263152573
																	}
																},
																{
																	"time": 11.817457475839898,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.007014137748049265,
																		"dt": -0.3604064941406251
																	},
																	"nextHandle": {
																		"dv": 0.007181952629435933,
																		"dt": 0.3498906762428429
																	}
																},
																{
																	"time": 15.947297918026647,
																	"value": 1,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
							"type": "object",
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": -89.99999999999997,
											"rotationY": -26.323708890336036,
											"rotationZ": -90.00000000000004,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 0.7609146118164061,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0241068887281497,
																		"dt": -0.49913718658749795
																	},
																	"nextHandle": {
																		"dv": -0.014411940959194514,
																		"dt": 0.3063455200195313
																	}
																},
																{
																	"time": 2.261199995425996,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.005717571252654929,
																		"dt": -0.45510655060177707
																	},
																	"nextHandle": {
																		"dv": 0.007326878109916127,
																		"dt": 0.4551127315715349
																	}
																},
																{
																	"time": 3.977542572021485,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.007014137748049265,
																		"dt": -0.3604064941406251
																	},
																	"nextHandle": {
																		"dv": 0.007181952629435933,
																		"dt": 0.3498906762428429
																	}
																},
																{
																	"time": 4.630711364746094,
																	"value": 1,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 150,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_DottedLines",
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationX": -7.061204112370308e-15,
											"rotationY": 89.568,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 11.838842379814496,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.010000000000000009,
																		"dt": -0.5315995788574224
																	},
																	"nextHandle": {
																		"dv": -0.0057800631017502786,
																		"dt": 0.3072679110659717
																	}
																},
																{
																	"time": 17.045573010383176,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.005717571252654929,
																		"dt": -0.45510655060177707
																	},
																	"nextHandle": {
																		"dv": 0.007326878109916127,
																		"dt": 0.4551127315715349
																	}
																},
																{
																	"time": 23.464241928109917,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.007014137748049265,
																		"dt": -0.3604064941406251
																	},
																	"nextHandle": {
																		"dv": 0.007181952629435933,
																		"dt": 0.3498906762428429
																	}
																},
																{
																	"time": 24.867601901123813,
																	"value": 1,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 500,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.22,
											"scaleY": 1.2,
											"scaleZ": 1.2,
											"rotationY": 90,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.6,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"loop": true,
															"keys": [
																{
																	"time": 2.265611724853516,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0241068887281497,
																		"dt": -0.49913718658749795
																	},
																	"nextHandle": {
																		"dv": -0.014411940959194514,
																		"dt": 0.3063455200195313
																	}
																},
																{
																	"time": 3.351429640201387,
																	"value": 0.2,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.005717571252654929,
																		"dt": -0.45510655060177707
																	},
																	"nextHandle": {
																		"dv": 0.007326878109916127,
																		"dt": 0.4551127315715349
																	}
																},
																{
																	"time": 4.617264099121095,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.007014137748049265,
																		"dt": -0.3604064941406251
																	},
																	"nextHandle": {
																		"dv": 0.007181952629435933,
																		"dt": 0.3498906762428429
																	}
																},
																{
																	"time": 23.887363022359704,
																	"value": 1,
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
									"keys": [
										{
											"time": 11,
											"value": -0.033333333333333326,
											"mode": 2
										},
										{
											"time": 12,
											"value": 1,
											"mode": 2
										},
										{
											"time": 24,
											"value": 1,
											"mode": 2
										},
										{
											"time": 25,
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
					"name": "PulseCountDown",
					"enabled": false,
					"scaleX": 1.1,
					"scaleY": 1.1,
					"scaleZ": 1.1,
					"children": [
						{
							"type": "object",
							"name": "PulseSmall",
							"scaleX": 1.08,
							"scaleY": 1.08,
							"scaleZ": 1.1,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"rotationX": 1.6721165498415313e-15,
									"rotationY": -18,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.2,
											"scaleY": 1.2,
											"scaleZ": 1.2,
											"rotationY": 90,
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
															"depthTest": "LessEqual"
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
														"texture": "Fx/Alphas/T_UI_Circle_Plain_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.013101749002796195,
																		"dt": -0.49994431761216657
																	},
																	"nextHandle": {
																		"dv": 0.012499999999999956,
																		"dt": 0.47681640625000005
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.012500000000000011,
																		"dt": -0.46623046874999996
																	},
																	"nextHandle": {
																		"dv": 0.009453350040267882,
																		"dt": 0.3499585872328905
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008527475489023193,
																"dt": -0.4999328272986826
															},
															"nextHandle": {
																"dv": 0.0008333333333333526,
																"dt": 0.488551025390625
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.997879638671876,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008333333333333526,
																"dt": -0.45326538085937595
															},
															"nextHandle": {
																"dv": 0.0006388001709488119,
																"dt": 0.34994614970350457
															}
														},
														{
															"time": 1,
															"value": 0.95,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
							"type": "object",
							"name": "PulseBig",
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"scaleY": 0.9999999999999999,
									"rotationX": 1.6841764469393999e-15,
									"rotationY": -19.222652143119696,
									"rotationZ": 44.6562253229215,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon_2",
											"rotationX": -89.99999999999997,
											"rotationY": -26.323708890336036,
											"rotationZ": -90.00000000000004,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.9,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_2_2048.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 150,
															"value": 1,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008527475489023193,
																"dt": -0.4999328272986826
															},
															"nextHandle": {
																"dv": 0.0008333333333333526,
																"dt": 0.488551025390625
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.997879638671876,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008333333333333526,
																"dt": -0.45326538085937595
															},
															"nextHandle": {
																"dv": 0.0006388001709488119,
																"dt": 0.34994614970350457
															}
														},
														{
															"time": 1,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_DottedLines",
											"scaleX": 1.11,
											"scaleY": 1.11,
											"scaleZ": 1.11,
											"rotationX": -7.061204112370308e-15,
											"rotationY": 89.568,
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
															"depthTest": "LessEqual"
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
														"alpha": 0.8,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_UI_Circle_DottedLines_2048.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 500,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008527475489023193,
																"dt": -0.4999328272986826
															},
															"nextHandle": {
																"dv": 0.0008333333333333526,
																"dt": 0.488551025390625
															}
														},
														{
															"time": 0.5,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.997879638671876,
															"value": 0.95,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0008333333333333526,
																"dt": -0.45326538085937595
															},
															"nextHandle": {
																"dv": 0.0006388001709488119,
																"dt": 0.34994614970350457
															}
														},
														{
															"time": 1,
															"value": 0.95,
															"mode": 0
														}
													]
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon_Circle",
											"scaleX": 1.22,
											"scaleY": 1.2,
											"scaleZ": 1.2,
											"rotationY": 90,
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
															"depthTest": "LessEqual"
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
														"texture": "Fx/Alphas/T_UI_Circle_1_2048.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.013101749002796195,
																		"dt": -0.49994431761216657
																	},
																	"nextHandle": {
																		"dv": 0.012499999999999956,
																		"dt": 0.47681640625000005
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0.7,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.012500000000000011,
																		"dt": -0.46623046874999996
																	},
																	"nextHandle": {
																		"dv": 0.009453350040267882,
																		"dt": 0.3499585872328905
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
															0.5490196078431373,
															0.2901960784313725,
															0.1803921568627451
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.x",
													"keyMode": 0,
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 300,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -50
															},
															"nextHandle": {
																"dv": 0,
																"dt": 50
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
									"keys": [
										{
											"time": 24,
											"value": 0,
											"mode": 2
										},
										{
											"time": 25,
											"value": 1,
											"mode": 2
										},
										{
											"time": 36.01781578993426,
											"value": 1,
											"mode": 2
										},
										{
											"time": 36.02781578993426,
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
					"name": "ColorSet",
					"source": "shaders/ColorSet.hx",
					"enabled": false,
					"props": {
						"amount": 1,
						"color": [
							1,
							1,
							1
						]
					}
				}
			]
		}
	]
}