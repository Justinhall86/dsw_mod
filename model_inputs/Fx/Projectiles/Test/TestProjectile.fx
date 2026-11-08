{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "group",
			"children": [
				{
					"type": "emitter",
					"name": "emitter",
					"props": {
						"emitRate": 20,
						"simulationSpace": "World",
						"maxCount": 128,
						"alignMode": "Screen",
						"instScale": 4,
						"instWorldSpeed_rand": [
							0,
							0,
							1
						]
					},
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
									"diffuseMap": "Fx/Gradients/alphaCircular.png"
								}
							]
						}
					]
				}
			]
		}
	]
}