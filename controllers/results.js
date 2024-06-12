const {getAllResults,addResult,updateResult,deleteResult,getResultByAdm,getResultByYear} = require('../services/resultsService')
const express = require('express')
const router = express.Router()
// get all Results
router.get('/',async(req,res)=>{
    try {
        const records = await getAllResults()
        res.status(200).json(records)
    } catch (error) {
        console.log(error)
        res.status(500).json({
            message:'something went wrong'
        })
    }
})
// get results by year
router.get('/:year',async(req,res)=>{
    try {
        const year = req.params.year
        const records = await getResultByYear(year)
        res.status(200).json(records[0])
    } catch (error) {
        console.log(error)
        res.status(500).json({
            message:'something went wrong'
        })
    }
})
// get result by student admin
router.get('/myresults/:adm',async(req,res)=>{
    try {
        const adm = req.params.year
        const records = await getResultByAdm(adm)
        res.status(200).json(records[0])
    } catch (error) {
        console.log(error)
        res.status(500).json({
            message:'something went wrong'
        })
    }
})
// delete Result by id
router.delete('/:id',async(req,res)=>{
    try {
        const id = req.params.id
        const results =await deleteResult(id)
        res.status(200).json(results)
    } catch (error) {
        console.log(error)
        res.status(500).json({
            message:'something went wrong'
        })
    }
})
// update or edit Result record
router.put('/',async(req,res)=>{
    try {
        const {studentAdm,unitName,unitCode,marks,semester,academicYear,id}=req.body
        const response  = await updateResult(studentAdm,unitName,unitCode,marks,semester,academicYear,id)
        res.status(200).json(response)
    } catch (error) {
        console.log(error)
        res.status(500).json({
            message:'something went wrong'
        })
    }
})
// create new Result
router.post('/',async(req,res)=>{
    try {
        const {studentAdm,unitName,unitCode,marks,semester,academicYear}=req.body
        const response  = await addResult(studentAdm,unitName,unitCode,marks,semester,academicYear)
        res.status(200).json(response)
    } catch (error) {
        console.log(error)
        res.status(500).json({
            message:'something went wrong'
        })
    }
})

module.exports=router