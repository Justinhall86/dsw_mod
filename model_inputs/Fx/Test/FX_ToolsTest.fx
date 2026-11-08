{
	"type": "fx",
	"cullingRadius": 0,
	"children": [
		{
			"type": "reference",
			"name": "PreviewScene",
			"source": "Fx/FX_PreviewScene.l3d",
			"locked": true
		},
		{
			"type": "object",
			"name": "FXRoot",
			"y": 0.04,
			"z": 1,
			"rotationZ": -82,
			"children": [
				{
					"type": "emitter",
					"name": "ScaleCurve ",
					"props": {
						"alignMode": "Screen",
						"instScale_rand": 1,
						"lifeTime": 3,
						"lifeTimeRand": 2,
						"emitRate": 1,
						"maxCount": 1,
						"instScale": 2
					},
					"x": 2.64,
					"y": -0.37,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
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
											"blend": "Add",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"props": {
								"tag": "TURN OFF BEFORE SAVE"
							},
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "AlphaCurve ",
					"props": {
						"alignMode": "Screen",
						"instScale_rand": 0,
						"emitRate": 1,
						"maxCount": 1,
						"lifeTime": 3,
						"lifeTimeRand": 2
					},
					"x": -2.07,
					"y": 0.29,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
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
											"blend": "Add",
											"shadows": false,
											"depthTest": "Less",
											"colorMask": 15,
											"enableStencil": false
										}
									},
									"children": [
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
													"props": {
														"tag": "TURN OFF BEFORE SAVE"
													},
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
											],
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "instScale",
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
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