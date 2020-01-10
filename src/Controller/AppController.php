<?php

namespace App\Controller;

use App\Entity\Absence;
use App\Entity\Classe;
use App\Entity\Etudiant;
use App\Entity\Image;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class AppController extends AbstractController
{
     //  UserPasswordEncoderInterface $passwordEncoder

    /**
     * @Route("/login/{email}/{psd}", name="login" , methods={"GET"})
     */
    public function index($email,$psd)
    {
       // $etd = new Etudiant();
        $repository = $this->getDoctrine()->getRepository(Etudiant::class);

      //  $crypt =$etd->setPassword($passwordEncoder->encodePassword($etd , 'password123'));

        $etudiant = $repository->findOneBy(['email' => $email , 'password' => $psd]);
        return $this->json($etudiant);
    }

    /**
     * @Route("/getUser/{code}", name="getUser" , methods={"GET"})
     */
    public function getidfromemail($code)
    {
        $repository = $this->getDoctrine()->getRepository(Etudiant::class);
        $etudiant = $repository->findOneBy(['code_etd' => $code]);
        return $this->json($etudiant);
    }

    /**
     * @Route("/getAbs/{id}", name="absence" , methods={"GET"})
     */
    public function getAbs($id)
    {
        $repositoryEtd = $this->getDoctrine()->getRepository(Etudiant::class);
        $etudiant = $repositoryEtd->findOneBy(['id' => $id]);

        $repository = $this->getDoctrine()->getRepository(Absence::class);
        $absence = $repository->findBy(['etudiant' => $etudiant , 'justification' => 0]);
        $mat = [];
        foreach($absence->getMatiere() as $absMat){
            array_push($mat,$absMat);
        }
        //$mat = $absence->getMatiere();

        $arr = [$mat,$absence];
        return $this->json($arr);
    }

    /**
     * @Route("/getImg/{alt}", name="getImg" , methods={"GET"})
     */
    public function getImgFromAlt($alt)
    {
        $repository = $this->getDoctrine()->getRepository(Image::class);
        $img = $repository->findOneBy(['alt' => $alt]);
/*
        $array = array();
        foreach(str_split(file_get_contents('../public/images/'.$img->getName())) as $byte)
         array_push($array, ord($byte));

        $byte_array = file_get_contents('../public/images/'.$img->getName());
        $byte = base64_encode($byte_array);
*/
        return $this->json($img->getUrl());
    }

    /**
     * @Route("/addImg/{idClass}/{alt}", name="addImg" , methods={"PUT"})
     */
    public function addClasseImg($idClass,$alt)
    {
        $repository = $this->getDoctrine()->getRepository(Image::class);
        $img = $repository->findOneBy(['alt' => $alt]);

        $repository = $this->getDoctrine()->getRepository(Classe::class);
        $classe = $repository->findOneBy(['id' => $idClass]);

        $classe->addImage($img);

        $em = $this->getDoctrine()->getManager();
        $em->persist($img);
        $em->flush();
        
        return $this->json($classe);
    }
    
}
