// Import via ES6 modules
import * as THREE from 'three';
import {Sampler, XMLExporter} from 'voxelizer';

// Generate a yellow torus mesh to voxelize.
let geometry = new THREE.TorusGeometry( 10, 3, 16, 100 );
let material = new THREE.MeshBasicMaterial( { color: 0xffff00 } );
let torus = new THREE.Mesh( geometry, material );

// Setup Voxelizer.
let options = {
  fill: false,
  color: true
};
const sampler = new Sampler('raycast', options);

// Voxelize torus.
const resolution = 10;
let data = sampler.sample(torus, resolution);

// Export result to XML.
const exporter = new XMLExporter()
exporter.parse(data, function (xml) {
  console.log(xml)
});