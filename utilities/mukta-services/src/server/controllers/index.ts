import MeasurementController from "./measurement/measurement.controller";
import MusterRollController from "./musterRoll/musterRoll.controller";
import MdmsV1GetController from "./mdmsGetResponse/mdmsV1Get.controller"
import PostsController from "./posts/posts.controller";
import TempsController from "./temp/temp.controller";




const controllers = [
  new PostsController(),
  new TempsController(),
  new MeasurementController(),
  new MusterRollController(),
  new MdmsV1GetController()
]

export default controllers;