package fpgamshr.interfaces

import chisel3._
import chisel3.util.{DecoupledIO}
import scala.collection.mutable.ArrayBuffer

class ModularBundle extends Bundle {
  private val connectionFunctions = ArrayBuffer.empty[(Bundle, Boolean) => Unit]
  def registerConnectionFunction(f: Bundle => Unit): Unit = connectionFunctions += {(b: Bundle, dummy: Boolean) => f(b)}
  def registerConnectionFunction(f: (Bundle, Boolean) => Unit): Unit = connectionFunctions += f
  def connectAllExisting(that: Bundle, ignoreNotMatching: Boolean=false): Unit = connectionFunctions.foreach(_(that, ignoreNotMatching))
  // def registerConnectionFunction(f: (Bundle, Boolean) => Unit): Unit = connectionFunctions += f
  // def connectAllExisting(that: Bundle, ignoreNotMatching: Boolean=true): Unit = connectionFunctions.foreach(_(that, ignoreNotMatching))
}

trait HasID extends ModularBundle {
  val idWidth: Int
  val id = UInt(idWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasID => this.id := same.id
    case _ => if(ignoreNotMatching) this.id := DontCare
  })
}

trait HasAddr extends ModularBundle {
  val addrWidth: Int
  val addr = UInt(addrWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasAddr => this.addr := same.addr
    case _ => if(ignoreNotMatching) this.addr := DontCare
  })
}

trait HasData extends ModularBundle {
  val dataWidth: Int
  val data = UInt(dataWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasData => this.data := same.data
    case _ => if(ignoreNotMatching) this.data := DontCare
  })
}
trait HasStrb extends ModularBundle {
  val strbWidth: Int
  val strb = UInt(strbWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasStrb => this.strb := same.strb
    case _ => if(ignoreNotMatching) this.strb := DontCare
  })
}
trait HasChosen extends ModularBundle {
  val chosenWidth: Int
  val chosen = UInt(chosenWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasChosen => this.chosen := same.chosen
    case _ => if(ignoreNotMatching) this.chosen := DontCare
  })
}

trait HasValid extends ModularBundle {
  val valid = Bool()
  def setValid()   = { this.valid := true.B  }
  def invalidate() = { this.valid := false.B }
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasValid => this.valid := same.valid
    case _ => if(ignoreNotMatching) this.valid := DontCare
  })
}

trait HasTag extends ModularBundle {
  val tagWidth: Int
  val tag = UInt(tagWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasTag => this.tag := same.tag
    case _ => if(ignoreNotMatching) this.tag := DontCare
  })
}

trait HasBurstLen extends ModularBundle {
  val burstLenWidth: Int
  val burstLen = UInt(burstLenWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
      case same: HasBurstLen => this.burstLen := same.burstLen
      case _ => if(ignoreNotMatching) this.burstLen := DontCare
    })
}

trait HasBurstParams extends HasBurstLen {
  val dataBufferAddrWidth: Int
  val dataBufferAddr = UInt(dataBufferAddrWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
      case same: HasBurstParams => this.dataBufferAddr := same.dataBufferAddr
      case _ => if(ignoreNotMatching) this.dataBufferAddr := DontCare
    })
}

trait HasDataBufferParams extends HasBurstParams {
  val burstStart = UInt(burstLenWidth.W)
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasDataBufferParams => this.burstStart := same.burstStart
    case _ => if(ignoreNotMatching) this.burstStart := DontCare
  })
}

trait HasIsLast extends ModularBundle {
  val isLast = Bool()
  registerConnectionFunction((that: Bundle, ignoreNotMatching: Boolean) => that match {
    case same: HasIsLast => this.isLast := same.isLast
    case _ => if(ignoreNotMatching) this.isLast := DontCare
  })
}
