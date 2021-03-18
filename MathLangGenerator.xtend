/*
 * generated by Xtext 2.12.0
 */
package assignment.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import javax.swing.JOptionPane
import assignment.lang.MathExp
import assignment.lang.Plus
import assignment.lang.Exp
import assignment.lang.Minus
import assignment.lang.Mult
import assignment.lang.Div
import assignment.lang.IntConstant
import assignment.lang.ParConstant

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class MathLangGenerator extends AbstractGenerator {
	static var mlg = new MathLangGenerator();
	
	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		val math = resource.allContents.filter(MathExp).next
		System::out.println("Math expression = " + math.display)
		val result = math.compute
		// For +1 score, replace with hovering, see Bettini Chapter 8
		JOptionPane.showMessageDialog(null, "result = " + result, "Math Language", JOptionPane.INFORMATION_MESSAGE)
	}

	//
	// Compute function: computes value of expression
	// Note: written according to illegal left-recursive grammar, requires fix
	//
	def static int compute(MathExp math) {
		System::out.println(mlg.display(math))
		val res = mlg.computeExp(math.exp);
		
		System::out.println("Result: " + res);
		return res
	}

	def dispatch int computeExp(Exp e) {
		System::out.println("Starting Exp: " + e.displayExp)
		return e.left.computeExp
	}

	def dispatch int computeExp(Plus e){
		System::out.println("Plus op: " + e.displayExp)
		return e.left.computeExp as Integer + e.right.computeExp
	}
	
	def dispatch int computeExp(Minus e){
		System::out.println("Minus op: " + e.left.displayExp + "-" + e.right.displayExp)
		return e.left.computeExp as Integer - e.right.computeExp
	}
	
	def dispatch int computeExp(IntConstant e){
		System::out.println("int: " + e.displayExp)
		return e.value
	}
	
	def Object getExpValue(Exp e){
		switch(e)
		{
			IntConstant: e.value
			ParConstant: e.par
		}
	}




	//
	// Display function: show complete syntax tree
	// Note: written according to illegal left-recursive grammar, requires fix
	//
	def CharSequence display(MathExp math) '''Math: «math.exp.displayExp»'''
	
	def dispatch CharSequence displayExp(Minus e) { '''«e.left.displayExp»-«e.right.displayExp»''' }
	def dispatch CharSequence displayExp(Plus e) { '''«e.left.displayExp»+«e.right.displayExp»''' }
	def dispatch CharSequence displayExp(Mult e) { '''«e.left»*«e.right»''' }
	def dispatch CharSequence displayExp(Div e) { '''«e.left»/«e.right»''' }
	def dispatch CharSequence displayExp(IntConstant e){'''«e.value»'''}
	def dispatch CharSequence displayExp(ParConstant e){'''«e.par.displayExp»'''}
	
	def dispatch String displayOp(Plus op) { "+" }

	def dispatch String displayOp(Minus op) { "-" }

}
